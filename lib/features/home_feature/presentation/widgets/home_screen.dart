import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/core/utils/alerts.dart';
import 'package:shafi/features/apointment_feature/data/models/category_model.dart';
import 'package:shafi/features/apointment_feature/data/models/doctor_model.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/apointment_controller.dart';
import 'package:shafi/features/apointment_feature/presentaion/screens/doctors_list_screen.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/features/auth_feature/presentation/forget_password/controllers/otp_controller.dart';
import 'package:shafi/features/home_feature/data/models/apointment_model.dart';
import 'package:shafi/features/home_feature/presentation/controllers/get_apointment_dates_controllers.dart';
import 'package:shafi/widgets/custom_button.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/cutom_shimmer_image.dart';
import 'package:shrink_sidemenu/shrink_sidemenu.dart';
import 'package:skeletonizer/skeletonizer.dart';
import 'package:table_calendar/table_calendar.dart';

class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final GlobalKey<SideMenuState> _sideMenuKey = GlobalKey<SideMenuState>();

  bool _isopened = false;

  DateTime? selectedDate;
  @override

  /// This widget builds the main screen with a side menu and appointment features.
  Widget build(BuildContext context) {
    // Retrieve the current state of the appointment controller
    ApointmentState state =
        ref.watch(apointmentControllerProvider).requireValue;

    return SideMenu(
      key: _sideMenuKey,
      inverse: true,
      menu: BuildMenu(),
      maxMenuWidth: 400.w,
      background: primaryColor,
      type: SideMenuType.shrikNRotate,
      child: GestureDetector(
        onTap: _isopened
            ? () {
                // Close the side menu when tapped outside
                setState(() {
                  _sideMenuKey.currentState?.closeSideMenu();
                  _isopened = !_isopened;
                });
              }
            : null,
        child: Scaffold(
          backgroundColor: Colors.white,
          body: Directionality(
            textDirection: TextDirection.rtl,
            child: SafeArea(
              child: RefreshIndicator(
                onRefresh: () async {
                  ref.refresh(getApointmentDatesControllerProvider);
                },
                child: ListView(
                  children: [
                    // AppBar with a drawer toggle button
                    HomeAppBar(drawerKey: _sideMenuKey, isOpened: _isopened),
                    SizedBox(height: 16.h),
                    // "Book your appointment now" text
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: CustomText(
                        "احجز موعدك الان",
                        size: 16.h,
                        bold: true,
                      ),
                    ),
                    SizedBox(height: 16.h),
                    // Calendar to select appointment date
                    ref.watch(getApointmentDatesControllerProvider).when(
                        data: (data) {
                          // return Directionality(
                          //   textDirection: TextDirection.ltr,
                          //   child: TableCalendar(
                          //     firstDay: DateTime.now(),
                          //     lastDay: DateTime.utc(2030, 3, 14),
                          //     focusedDay: selectedDate ?? DateTime.now(),
                          //     currentDay: selectedDate ?? DateTime.now(),
                          //     onDaySelected: (select, value) {
                          //       // Update the selected date

                          //     },
                          //     calendarStyle: CalendarStyle(),
                          //     calendarFormat: CalendarFormat.month,
                          //   ),
                          // );

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
                                        // Log the selected date and notify the controller

                                        if (data.dates
                                            .contains(data.dates[index])) {
                                          ref
                                              .read(apointmentControllerProvider
                                                  .notifier)
                                              .selectDate(
                                                date: data.dates[index],
                                              );
                                        } else {
                                          ref
                                              .read(apointmentControllerProvider
                                                  .notifier)
                                              .clearDate();
                                          Alerts.showSnackBar(
                                              "لا توجد حوجزات لهذا التاريخ");
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
                                child: TableCalendar(
                              firstDay: DateTime.now(),
                              lastDay: DateTime.utc(2030, 3, 14),
                              focusedDay: selectedDate ?? DateTime.now(),
                              currentDay: selectedDate ?? DateTime.now(),
                              onDaySelected: (select, value) {
                                // Update the selected date
                                setState(() {
                                  selectedDate = select;
                                });
                                // Log the selected date and notify the controller
                                ref
                                    .read(apointmentControllerProvider.notifier)
                                    .selectDate(
                                        date:
                                            "${select.year}-${select.month.toString().padLeft(2, "0")}-${select.day.toString().padLeft(2, "0")}");
                              },
                              calendarStyle: CalendarStyle(),
                              calendarFormat: CalendarFormat.month,
                            ))),
                    // Show booking button if a date is selected
                    if (state.selectedDate != null) SizedBox(height: 16.h),
                    AnimatedSwitcher(
                      duration: Duration(milliseconds: 300),
                      child: state.selectedDate != null
                          ? Padding(
                              padding: EdgeInsets.symmetric(horizontal: 16.w),
                              child: CustomButton(
                                buttonText: "احجز الان",
                                onTap: () async {
                                  // Check if the user's phone is verified
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
                                textColor: Colors.white,
                              ),
                            )
                          : SizedBox.shrink(),
                    ),
                    SizedBox(height: 16.h),
                    // Display latest appointments
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 16.w),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          CustomText(
                            "اخر الموعيد",
                            size: 16.h,
                            bold: true,
                          ),
                          SizedBox(height: 8.h),
                          // Display the list of appointments
                          ref.watch(apointmentControllerProvider).when(
                                data: (data) {
                                  return Column(
                                    children: List.generate(
                                        data.myApointments.length, (index) {
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
                                      padding:
                                          EdgeInsets.symmetric(vertical: 16.h),
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
        border: Border.all(color: primaryColor),
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
              color: primaryColor,
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
                  border: Border.all(color: primaryColor),
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
                        color: primaryColor,
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

class BuildMenu extends ConsumerWidget {
  const BuildMenu({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    UserState userState = ref.watch(userControllerProvider).requireValue;
    return Directionality(
      textDirection: TextDirection.rtl,
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(vertical: 50.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 16.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 70.h,
                    width: 70.h,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(36.r),
                      child: CustomShimmerImage(
                          image:
                              "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=600"),
                    ),
                  ),
                  SizedBox(height: 16.0),
                  CustomText(
                    "أهلا,${userState.user!.patient!.name}",
                    white: true,
                    size: 18.h,
                  ),
                  SizedBox(height: 20.0),
                ],
              ),
            ),
            ListTile(
              onTap: () {},
              leading: const Icon(Icons.verified_user,
                  size: 20.0, color: Colors.white),
              title: CustomText(
                "الصفحة الشخصيه",
                white: true,
                bold: true,
                size: 14.h,
                align: TextAlign.start,
              ),
              textColor: Colors.white,
              dense: true,

              // padding: EdgeInsets.zero,
            ),
            ListTile(
              onTap: () {
                NavigationService.push(Routes.myApointmentScreen);
              },
              leading: const Icon(Icons.calendar_month,
                  size: 20.0, color: Colors.white),
              title: CustomText(
                "موعيدي",
                size: 14.h,
                align: TextAlign.start,
                bold: true,
                white: true,
              ),
              textColor: Colors.white,
              dense: true,

              // padding: EdgeInsets.zero,
            ),
            ListTile(
              onTap: () {
                NavigationService.push(Routes.medicalHestoryScreen);
              },
              leading: const Icon(Icons.medical_information,
                  size: 20.0, color: Colors.white),
              title: CustomText(
                "العلاجات السابقه",
                size: 14.h,
                align: TextAlign.start,
                bold: true,
                white: true,
              ),
              textColor: Colors.white,
              dense: true,

              // padding: EdgeInsets.zero,
            ),
            ListTile(
              onTap: () {
                ref.read(userControllerProvider.notifier).clearUser();
                ref.read(userControllerProvider.notifier).clearUser();
                ref.read(apointmentControllerProvider.notifier).clearAlldata();
                NavigationService.pushNamedAndRemoveUntil(Routes.login);
              },
              leading:
                  const Icon(Icons.logout, size: 20.0, color: Colors.white),
              title: CustomText(
                "تسجيل خروج",
                bold: true,
                size: 14.h,
                align: TextAlign.start,
                white: true,
              ),
              textColor: Colors.white,
              dense: true,

              // padding: EdgeInsets.zero,
            ),
          ],
        ),
      ),
    );
  }
}

class HomeAppBar extends ConsumerStatefulWidget {
  HomeAppBar({super.key, required this.drawerKey, required this.isOpened});
  bool isOpened;
  final GlobalKey<SideMenuState> drawerKey;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeAppBarState();
}

class _HomeAppBarState extends ConsumerState<HomeAppBar> {
  @override
  Widget build(BuildContext context) {
    UserState user = ref.watch(userControllerProvider).requireValue;
    return Container(
      width: deviceWidth,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: AppColorLight().kAppBarColor,
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(30.r),
          bottomRight: Radius.circular(16.r),
        ),
        boxShadow: [
          BoxShadow(
              color: Colors.black.withOpacity(0.2),
              offset: Offset(0, 0),
              blurRadius: 58),
        ],
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                if (widget.isOpened) {
                  widget.drawerKey.currentState?.openSideMenu();
                  widget.isOpened = !widget.isOpened;
                } else {
                  widget.drawerKey.currentState?.openSideMenu();
                  widget.isOpened = !widget.isOpened;
                }
              });
            },
            child: Container(
              padding: EdgeInsets.all(10.h),
              decoration: BoxDecoration(
                color: Colors.white,
                shape: BoxShape.circle,
                boxShadow: [
                  BoxShadow(
                    color: Colors.black.withOpacity(0.2),
                    offset: Offset(0, 0),
                    blurRadius: 10,
                  )
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.menu,
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ),
          Row(
            children: [
              Column(
                crossAxisAlignment: CrossAxisAlignment.end,
                children: [
                  CustomText(
                    "${user.user!.patient!.name}",
                    size: 12.h,
                    bold: true,
                  ),
                  CustomText("23/10/2024")
                ],
              ),
              SizedBox(
                width: 10.w,
              ),
              SizedBox(
                height: 40.h,
                width: 40.h,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(22.r),
                  child: CustomShimmerImage(
                      image:
                          "https://images.pexels.com/photos/771742/pexels-photo-771742.jpeg?auto=compress&cs=tinysrgb&w=600"),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
