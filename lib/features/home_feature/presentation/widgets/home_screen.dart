// ignore_for_file: unused_result

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/features/apointment_feature/data/models/category_model.dart';
import 'package:shafi/features/apointment_feature/data/models/doctor_model.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/apointment_controller.dart';
import 'package:shafi/features/apointment_feature/presentaion/screens/doctors_list_screen.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/features/auth_feature/presentation/forget_password/controllers/otp_controller.dart';
import 'package:shafi/features/home_feature/data/models/apointment_model.dart';
import 'package:shafi/features/home_feature/presentation/controllers/get_apointment_dates_controllers.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  DateTime? selectedDate;
  @override

  /// This widget builds the main screen with a side menu and appointment features.
  Widget build(BuildContext context) {
    // Retrieve the current state of the appointment controller
    ApointmentState state =
        ref.watch(apointmentControllerProvider).requireValue;

    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async {
            ref.refresh(getApointmentDatesControllerProvider);
          },
          child: ListView(
            children: [
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: CustomText(
                  S.of(context).ask_for_apointment,
                  size: 16.h,
                  bold: true,
                ),
              ),
              SizedBox(height: 16.h),
              // Calendar to select appointment date
              ref.watch(getApointmentDatesControllerProvider).when(
                    data: (data) {
                      return SizedBox(
                        width: deviceWidth,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          reverse: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: data.dates.length,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                InkWell(
                                  onTap: () {
                                    ref
                                        .read(apointmentControllerProvider
                                            .notifier)
                                        .selectDate(date: data.dates[index]);
                                    if (ref
                                            .read(userControllerProvider)
                                            .requireValue
                                            .user!
                                            .patient!
                                            .is_phone_verified ==
                                        true) {
                                      // Show the doctors list if verified
                                      showModalBottomSheet(
                                          context: context,
                                          builder: (_) {
                                            return DoctorsListScreen();
                                          });
                                    } else {
                                      // Resend verification code if not verified
                                      ref
                                          .read(otpControllerProvider.notifier)
                                          .resendCode();
                                      NavigationService.pushNamedAndRemoveUntil(
                                          Routes.otpPassword);
                                    }
                                  },
                                  child: Padding(
                                    padding: EdgeInsets.only(left: 10.w),
                                    child: RecommendedApointmentCard(
                                        date: data.dates[index]),
                                  ),
                                ),
                              ],
                            );
                          },
                        ),
                      );
                    },
                    error: (error, _) => CustomText("$error "),
                    loading: () => Skeletonizer(
                      child: SizedBox(
                        width: deviceWidth,
                        child: GridView.builder(
                          shrinkWrap: true,
                          physics: const NeverScrollableScrollPhysics(),
                          reverse: false,
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 5,
                          ),
                          padding: EdgeInsets.symmetric(horizontal: 16.w),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return Column(
                              children: [
                                Padding(
                                  padding: EdgeInsets.only(left: 10.w),
                                  child: RecommendedApointmentCard(
                                      date: "2023-01-01"),
                                ),
                              ],
                            );
                          },
                        ),
                      ),
                    ),
                  ),
              // // Show booking button if a date is selected
              // if (state.selectedDate != null) SizedBox(height: 16.h),
              // AnimatedSwitcher(
              //   duration: Duration(milliseconds: 300),
              //   child: state.selectedDate != null
              //       ? Padding(
              //           padding: EdgeInsets.symmetric(horizontal: 16.w),
              //           child: CustomButton(
              //             buttonText: "احجز الان",
              //             onTap: () async {
              //               // Check if the user's phone is verified
              //               if (ref
              //                       .read(userControllerProvider)
              //                       .requireValue
              //                       .user!
              //                       .patient!
              //                       .is_phone_verified ==
              //                   true) {
              //                 // Show the doctors list if verified
              //                 showModalBottomSheet(
              //                     context: context,
              //                     builder: (_) {
              //                       return DoctorsListScreen();
              //                     });
              //               } else {
              //                 // Resend verification code if not verified
              //                 ref
              //                     .read(otpControllerProvider.notifier)
              //                     .resendCode();
              //                 NavigationService.pushNamedAndRemoveUntil(
              //                     Routes.otpPassword);
              //               }
              //             },
              //             textColor: Colors.white,
              //           ),
              //         )
              //       : SizedBox.shrink(),
              // ),

              SizedBox(height: 16.h),
              // Display latest appointments
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 16.w),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      S.of(context).your_last_apointments,
                      size: 16.h,
                      bold: true,
                    ),
                    SizedBox(height: 8.h),
                    // Display the list of appointments
                    ref.watch(apointmentControllerProvider).when(
                          data: (data) {
                            return Column(
                              children: List.generate(data.myApointments.length,
                                  (index) {
                                return InkWell(
                                  onTap: () async {
                                    if (data.myApointments[index]
                                            .agora_channel !=
                                        null) {
                                      NavigationService.push(
                                          Routes.videoCallScreen,
                                          arguments: {
                                            "apointmentModel":
                                                data.myApointments[index]
                                          });
                                    }
                                  },
                                  child: ApointmentCardWidget(
                                    apointment: data.myApointments[index],
                                  ),
                                );
                              }),
                            );
                          },
                          error: (error, _) => CustomText("$error "),
                          loading: () => Skeletonizer(
                              enabled: true,
                              child: ListView.builder(
                                shrinkWrap: true,
                                padding: EdgeInsets.symmetric(vertical: 16.h),
                                itemCount: 10,
                                itemBuilder: (_, index) {
                                  return ApointmentCardWidget(
                                    apointment: ApointmentModel(
                                        id: 1,
                                        sub_category: CategoryModel(
                                          id: 0,
                                          name: "loading",
                                        ),
                                        category: CategoryModel(
                                          id: 0,
                                          name: "loading",
                                        ),
                                        doctor: DoctorModel(
                                          id: 0,
                                          name: "loading",
                                        ),
                                        date: "2024-12-02",
                                        start_time: "06:20",
                                        end_time: "06:20"),
                                  );
                                },
                              )),
                        ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RecommendedApointmentCard extends ConsumerStatefulWidget {
  const RecommendedApointmentCard({
    super.key,
    required this.date,
  });
  final String date;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _RecommendedApointmentCardState();
}

class _RecommendedApointmentCardState
    extends ConsumerState<RecommendedApointmentCard> {
  String? day;
  String? strMonth;

  String _monthBuilder(int month) {
    switch (month) {
      case 1:
        return "Jan"; // January
      case 2:
        return "Feb"; // February
      case 3:
        return "Mar"; // March
      case 4:
        return "Apr"; // April
      case 5:
        return "May"; // May
      case 6:
        return "Jun"; // June
      case 7:
        return "Jul"; // July
      case 8:
        return "Aug"; // August
      case 9:
        return "Sep"; // September
      case 10:
        return "Oct"; // October
      case 11:
        return "Nov"; // November
      case 12:
        return "Dec"; // December
      default:
        return ""; // Invalid month
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    List newStr = widget.date.split("-");

    day = newStr[2];
    strMonth = _monthBuilder(int.parse(newStr[1]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 60.h,
      width: 60.h,
      decoration: BoxDecoration(
        color: Colors.white,
        border: Border.all(color: primaryColorDark),
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: 60.h,
            height: 30.h,
            decoration: BoxDecoration(
              color: primaryColorDark,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(10.r),
                topRight: Radius.circular(10.r),
              ),
            ),
            child: Center(
              child: CustomText(
                "$strMonth",
                bold: true,
                white: true,
              ),
            ),
          ),
          CustomText(
            "$day",
            bold: true,
            size: 14.h,
          )
        ],
      ),
    );
  }
}

class ApointmentCardWidget extends StatefulWidget {
  const ApointmentCardWidget({super.key, required this.apointment});

  final ApointmentModel apointment;

  @override
  State<ApointmentCardWidget> createState() => _ApointmentCardWidgetState();
}

class _ApointmentCardWidgetState extends State<ApointmentCardWidget> {
  String? day;
  String? strMonth;

  /// Converts a month number to its corresponding abbreviation.
  ///
  /// Takes an integer [month] from 1 to 12 and returns the corresponding
  /// three-letter month abbreviation. Returns an empty string if the
  /// month number is not valid.
  String _monthBuilder(int month) {
    switch (month) {
      case 1:
        return "Jan"; // January
      case 2:
        return "Feb"; // February
      case 3:
        return "Mar"; // March
      case 4:
        return "Apr"; // April
      case 5:
        return "May"; // May
      case 6:
        return "Jun"; // June
      case 7:
        return "Jul"; // July
      case 8:
        return "Aug"; // August
      case 9:
        return "Sep"; // September
      case 10:
        return "Oct"; // October
      case 11:
        return "Nov"; // November
      case 12:
        return "Dec"; // December
      default:
        return ""; // Invalid month
    }
  }

  @override
  void initState() {
    super.initState();

    List newStr = widget.apointment.date!.split("-");

    day = newStr[2];
    strMonth = _monthBuilder(int.parse(newStr[1]));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(10.h),
      margin: EdgeInsets.only(bottom: 10.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(10.r),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.3),
              offset: Offset(0, 0),
              blurRadius: 30),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              Container(
                height: 50.h,
                width: 50.h,
                decoration: BoxDecoration(
                  color: Colors.white,
                  border: Border.all(color: primaryColorDark),
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Container(
                      width: 50.h,
                      height: 20.h,
                      decoration: BoxDecoration(
                        color: primaryColorDark,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10.r),
                          topRight: Radius.circular(10.r),
                        ),
                      ),
                      child: Center(
                        child: CustomText(
                          "$strMonth",
                          bold: true,
                          white: true,
                        ),
                      ),
                    ),
                    CustomText(
                      "$day",
                      bold: true,
                      size: 14.h,
                    )
                  ],
                ),
              ),
              SizedBox(
                width: 10.w,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    "${widget.apointment.doctor?.name},",
                    size: 16.h,
                    pv: 0,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomText(
                    "${widget.apointment.sub_category?.name}",
                    size: 16.h,
                    pv: 0,
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  CustomText(
                    "${widget.apointment.start_time}",
                    size: 14.h,
                    pv: 0,
                    bold: true,
                  )
                ],
              )
            ],
          ),
          Icon(Icons.arrow_forward_ios)
        ],
      ),
    );
  }
}
