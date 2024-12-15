import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/extensions/widget_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/apointment_controller.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/questions_controller.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/widgets/custom_button.dart';
import 'package:shafi/widgets/custom_text.dart';

class ApointmentSummaryScreen extends ConsumerWidget {
  const ApointmentSummaryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: CustomText(
          "ملخص الطلب",
          size: 16.h,
          bold: true,
        ),
        centerTitle: true,
        backgroundColor: Colors.white,
        leading: InkWell(
          onTap: () {
            NavigationService.goBack();
          },
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            CustomText(
              "تاكيد على الحجز",
              size: 18.h,
              bold: true,
            ),
            SizedBox(height: 16.h),
            SizedBox(
              width: double.infinity,
              child: Card(
                elevation: 4,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10.r),
                ),
                child: Padding(
                  padding: EdgeInsets.all(16.r),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisSize: MainAxisSize.max,
                    children: List.generate(
                        ref
                            .read(questionsControllerProvider)
                            .requireValue
                            .answers
                            .length, (index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          CustomText(
                            "${ref.read(questionsControllerProvider).requireValue.answers[index].title}",
                            size: 16.h,
                            bold: true,
                            color: primaryColor,
                          ),
                          CustomText(
                            "${ref.read(questionsControllerProvider).requireValue.answers[index].answer}",
                            size: 14.h,
                            bold: true,
                          ),
                          index !=
                                  ref
                                          .read(questionsControllerProvider)
                                          .requireValue
                                          .answers
                                          .length -
                                      1
                              ? Divider(
                                  height: 1.h,
                                )
                              : SizedBox.shrink()
                        ],
                      );
                    }),
                  ),
                ),
              ),
            ),
            SizedBox(height: 16.h),
            Card(
              elevation: 4.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.r),
              ),
              child: Padding(
                padding: EdgeInsets.all(16.r),
                child: Column(
                  children: [
                    CustomText(
                      "تفاصيل الحجز",
                      size: 14.h,
                      bold: true,
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        CustomText(
                          "اسم المريض:",
                          size: 12.h,
                        ),
                        Spacer(),
                        CustomText(
                          ref
                              .read(userControllerProvider)
                              .requireValue
                              .user!
                              .patient!
                              .name!,
                          size: 12.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        CustomText(
                          "تاريخ الحجز:",
                          size: 12.h,
                        ),
                        Spacer(),
                        CustomText(
                          ref
                                  .read(apointmentControllerProvider)
                                  .requireValue
                                  .selectedDate ??
                              '',
                          size: 12.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        CustomText(
                          "معاد الحجز",
                          size: 12.h,
                        ),
                        Spacer(),
                        CustomText(
                          ref
                                  .read(apointmentControllerProvider)
                                  .requireValue
                                  .selectedApointment ??
                              '',
                          size: 12.h,
                        ),
                      ],
                    ),
                    SizedBox(height: 8.h),
                    Row(
                      children: [
                        CustomText(
                          "اسم الطبيب",
                          size: 12.h,
                        ),
                        Spacer(),
                        CustomText(
                          ref
                                  .read(apointmentControllerProvider)
                                  .requireValue
                                  .selectedDoctor!
                                  .name ??
                              '',
                          size: 12.h,
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
            SizedBox(height: 16.h),
            CustomButton(
              buttonText: "ارسال",
              textColor: Colors.white,
              backgroundColor: primaryColor,
              radius: 10.r,
              loading: ref.read(apointmentControllerProvider).isLoading,
              onTap: () async {
                await ref
                    .read(apointmentControllerProvider.notifier)
                    .bookSubmition();
              },
            ),
          ],
        ),
      ),
    ).rtl();
  }
}

// class ApointmentSummaryScreen extends ConsumerWidget {
//   const ApointmentSummaryScreen({super.key});

//   @override
//   Widget build(BuildContext context, WidgetRef ref) {
//     return Scaffold(
//       floatingActionButton: MediaQuery.of(context).viewInsets.bottom > 0
//           ? null
//           : Padding(
//               padding: EdgeInsets.symmetric(horizontal: 16.w),
//               child: CustomButton(
//                 buttonText: "ارسال",
//                 textColor: kAppBarColor,
//                 backgroundColor: primaryColor,
//                 radius: 10.r,
//                 loading: ref.read(apointmentControllerProvider).isLoading,
//                 onTap: () async {
//                   await ref
//                       .read(apointmentControllerProvider.notifier)
//                       .bookSubmition();
//                 },
//               ),
//             ),
//       floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
//       appBar: AppBar(
//         title: CustomText(
//           "ملخص الطلب",
//           size: 14.h,
//           bold: true,
//         ),
//         centerTitle: true,
//       ),
//       body: SizedBox(
//         width: deviceWidth,
//         child: SingleChildScrollView(
//           padding: EdgeInsets.all(16.r),
//           child: Column(
//             crossAxisAlignment: CrossAxisAlignment.start,
//             children: [
//               CustomText(
//                 "تاكيد على الحجز",
//                 size: 16.h,
//                 bold: true,
//               ),
//               SizedBox(
//                 height: 16.h,
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomText(
//                     "تاريخ الحجز",
//                     size: 14.h,
//                     bold: true,
//                   ),
//                   CustomText(
//                     "${ref.read(apointmentControllerProvider).requireValue.selectedDate}",
//                     size: 14.h,
//                     bold: true,
//                     color: primaryOrangeColor,
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomText(
//                     "معاد الحجز",
//                     size: 14.h,
//                     bold: true,
//                   ),
//                   CustomText(
//                     "${ref.read(apointmentControllerProvider).requireValue.selectedApointment}",
//                     size: 14.h,
//                     bold: true,
//                     color: primaryOrangeColor,
//                   )
//                 ],
//               ),
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   CustomText(
//                     "اسم الطبيب",
//                     size: 14.h,
//                     bold: true,
//                   ),
//                   CustomText(
//                     "${ref.read(apointmentControllerProvider).requireValue.selectedDoctor?.name}",
//                     size: 14.h,
//                     bold: true,
//                     color: primaryOrangeColor,
//                   )
//                 ],
//               ),
//               SizedBox(
//                 height: 16.h,
//               ),
//               CustomText(
//                 "الاسأله",
//                 size: 16.h,
//                 bold: true,
//               ),
//               SizedBox(
//                 height: 16.h,
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: List.generate(
//                     ref
//                         .read(questionsControllerProvider)
//                         .requireValue
//                         .answers
//                         .length, (index) {
//                   return Column(
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       CustomText(
//                         "${ref.read(questionsControllerProvider).requireValue.answers[index].title}",
//                         size: 16.h,
//                         bold: true,
//                       ),
//                       CustomText(
//                         "${ref.read(questionsControllerProvider).requireValue.answers[index].answer}",
//                         size: 14.h,
//                         bold: true,
//                         color: primaryOrangeColor,
//                       )
//                     ],
//                   );
//                 }),
//               )
//             ],
//           ),
//         ),
//       ),
//     ).rtl();
//   }
// }

