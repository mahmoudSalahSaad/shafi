import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/extensions/widget_extensions.dart';
import 'package:shafi/core/resources/color.dart';
import 'package:shafi/core/resources/values_manager.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/core/utils/alerts.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/apointment_controller.dart';
import 'package:shafi/widgets/custom_button.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';

class ApointmentTimesScreen extends ConsumerWidget {
  const ApointmentTimesScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(apointmentControllerProvider);
    return Directionality(
        textDirection: TextDirection.rtl,
        child: Scaffold(
          floatingActionButton: CustomButton(
            buttonText: "التالي",
            onTap: () {
              if (state.requireValue.selectedApointment != null) {
                NavigationService.push(Routes.categoryScreen);
              } else {
                Alerts.showSnackBar("برجاء اختيار توقيت مناسب اولا",
                    alertsType: AlertsType.info);
              }
            },
            textColor: Colors.white,
            width: deviceWidth * .94,
          ),
          floatingActionButtonLocation:
              FloatingActionButtonLocation.centerFloat,
          appBar: AppBar(
            title: CustomText(
              "الموعيدالمتاحة",
              size: 14.h,
              bold: true,
            ),
            centerTitle: true,
            leading: InkWell(
              onTap: () => NavigationService.goBack(),
              child: Icon(Icons.arrow_back_ios_rounded),
            ),
          ),
          body: LiquidPullToRefresh(
            showChildOpacityTransition: true,
            springAnimationDurationInMilliseconds: 100,
            onRefresh: () async {
              await ref
                  .read(apointmentControllerProvider.notifier)
                  .getApointmentTimes();
            },
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: CustomText(
                      "التوقيتات المتاحة",
                      size: 16.h,
                      bold: true,
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  state.isLoading
                      ? Shimmer.fromColors(
                          baseColor: Colors.grey.shade200,
                          highlightColor: Colors.grey.shade300,
                          child: GridView.builder(
                            shrinkWrap: true,
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4,
                                    childAspectRatio: 2.1,
                                    crossAxisSpacing: 10.h,
                                    mainAxisSpacing: 10.h),
                            itemCount: 100,
                            itemBuilder: (_, index) {
                              return Container(
                                padding: EdgeInsets.all(10.r),
                                decoration: BoxDecoration(
                                  color: AppColorLight().kAppBarColor,
                                  border: Border.all(color: primaryOrangeColor),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      "_____",
                                      size: 16,
                                    )
                                  ],
                                ),
                              );
                            },
                          ))
                      : GridView.builder(
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          padding: EdgeInsets.only(
                              left: 16.w, right: 16.w, bottom: 400.h),
                          gridDelegate:
                              SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 4,
                                  childAspectRatio: 2.1,
                                  crossAxisSpacing: 10.h,
                                  mainAxisSpacing: 10.h),
                          itemCount: state.requireValue.apointmentTimes.length,
                          itemBuilder: (_, index) {
                            return InkWell(
                              onTap: () {
                                ref
                                    .read(apointmentControllerProvider.notifier)
                                    .selectedtime(
                                        time: state
                                            .requireValue.apointmentTimes[index]
                                            .toString());
                              },
                              child: Container(
                                decoration: BoxDecoration(
                                  color:
                                      (state.requireValue.selectedApointment ??
                                                  "") ==
                                              state.requireValue
                                                  .apointmentTimes[index]
                                          ? primaryColor
                                          : AppColorLight().kAppBarColor,
                                  border: Border.all(
                                      color: (state.requireValue
                                                      .selectedApointment ??
                                                  "") ==
                                              state.requireValue
                                                  .apointmentTimes[index]
                                          ? primaryColor
                                          : primaryOrangeColor),
                                  borderRadius: BorderRadius.circular(10.r),
                                ),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    CustomText(
                                      state.requireValue.apointmentTimes[index]
                                          .toString(),
                                      color: (state.requireValue
                                                      .selectedApointment ??
                                                  "") ==
                                              state.requireValue
                                                  .apointmentTimes[index]
                                          ? Colors.white
                                          : Colors.black,
                                      size: 16,
                                    )
                                  ],
                                ),
                              ),
                            );
                          },
                        ).ltr()
                ],
              ),
            ),
          ),
        ));
  }
}
