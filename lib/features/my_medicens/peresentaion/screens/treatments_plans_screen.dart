import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/color.dart';
import 'package:shafi/core/resources/values_manager.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/features/my_medicens/peresentaion/controllers/treatment_plans_controller.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

class TreatmentsPlansScreen extends ConsumerWidget {
  const TreatmentsPlansScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText("البرنامج العلاجي", size: 14.h, bold: true),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            NavigationService.goBack();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ref.watch(treatmentPlansControllerProvider).when(
            data: (data) {
              return SizedBox(
                height: deviceHeight,
                width: deviceWidth,
                child: Padding(
                  padding: EdgeInsets.all(16.h),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.treatmentsPlans!.length,
                    itemBuilder: (_, index) {
                      return Container(
                        margin: EdgeInsets.only(bottom: 16.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          border: Border.all(color: primaryColor),
                          borderRadius: BorderRadius.circular(10.r),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.black.withOpacity(0.2),
                              offset: Offset(0, 0),
                              blurRadius: 10,
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              padding: EdgeInsets.all(8.h),
                              decoration: BoxDecoration(
                                color: primaryColor,
                                borderRadius: BorderRadius.only(
                                  topLeft: Radius.circular(10.r),
                                  topRight: Radius.circular(10.r),
                                ),
                              ),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomText(
                                      data.treatmentsPlans![index].medicine
                                          .toString(),
                                      white: true,
                                      bold: true,
                                    ),
                                    CustomText(
                                      data.treatmentsPlans![index].startDate
                                          .toString(),
                                      white: true,
                                      bold: true,
                                    )
                                  ]),
                            ),
                            Padding(
                              padding: EdgeInsets.all(16.h),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisSize: MainAxisSize.max,
                                children: [
                                  CustomText(
                                    "التعليمات",
                                    size: 16.h,
                                    bold: true,
                                    color: primaryColorDark,
                                  ),
                                  CustomText(
                                    data.treatmentsPlans![index].instructions
                                        .toString(),
                                  ),
                                  CustomText(
                                    "الملاحظات",
                                    size: 16.h,
                                    bold: true,
                                    color: primaryColorDark,
                                  ),
                                  CustomText(
                                    data.treatmentsPlans![index].notes
                                        .toString(),
                                  ),
                                  CustomText(
                                    "تاريخ الانتهاء",
                                    size: 16.h,
                                    bold: true,
                                    color: primaryColorDark,
                                  ),
                                  CustomText(
                                    data.treatmentsPlans![index].endDate
                                        .toString(),
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      );
                    },
                  ),
                ),
              );
            },
            error: (error, currentTrace) => Text("$error ,,$currentTrace"),
            loading: () => Skeletonizer(
              enabled: true,
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return Container(
                      padding: EdgeInsets.all(16.h),
                      margin: EdgeInsets.only(bottom: 16.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            offset: Offset(0, 0),
                            blurRadius: 10,
                          ),
                        ],
                      ),
                    );
                  },
                ),
              ),
            ),
          ),
    );
  }
}
