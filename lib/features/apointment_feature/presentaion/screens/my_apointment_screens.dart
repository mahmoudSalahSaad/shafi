import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:liquid_pull_to_refresh/liquid_pull_to_refresh.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/features/apointment_feature/data/models/category_model.dart';
import 'package:shafi/features/apointment_feature/data/models/doctor_model.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/apointment_controller.dart';
import 'package:shafi/features/home_feature/data/models/apointment_model.dart';
import 'package:shafi/features/home_feature/presentation/widgets/home_screen.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:skeletonizer/skeletonizer.dart';

class MyApointmentScreen extends ConsumerStatefulWidget {
  const MyApointmentScreen({super.key});

  @override
  ConsumerState createState() => _MyApointmentScreenState();
}

class _MyApointmentScreenState extends ConsumerState<MyApointmentScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: CustomText(
          'مواعيدي',
          size: 14.h,
          bold: true,
        ),
        backgroundColor: primaryColor,
        centerTitle: true,
        leading: GestureDetector(
          onTap: () {
            NavigationService.goBack();
          },
          child: Icon(Icons.arrow_back_ios_new_rounded),
        ),
      ),
      body: LiquidPullToRefresh(
        showChildOpacityTransition: true,
        springAnimationDurationInMilliseconds: 100,
        onRefresh: () async {
          ref.read(apointmentControllerProvider.notifier).getMyApointments();
        },
        child: ref.watch(apointmentControllerProvider).when(
              data: (data) {
                return Padding(
                  padding: EdgeInsets.all(16.h),
                  child: ListView.builder(
                    padding: EdgeInsets.symmetric(vertical: 16.h),
                    itemCount: data.myApointments.length,
                    itemBuilder: (_, index) {
                      return InkWell(
                        onTap: () {
                          if (data.myApointments[index].agora_channel != null) {
                            NavigationService.push(Routes.videoCallScreen,
                                arguments: {
                                  "apointmentModel": data.myApointments[index]
                                });
                          }
                        },
                        child: ApointmentCardWidget(
                          apointment: data.myApointments[index],
                        ),
                      );
                    },
                  ),
                );
              },
              error: (e, strrError) => Text("$e"),
              loading: () {
                return Padding(
                  padding: EdgeInsets.all(16.h),
                  child: Skeletonizer(
                      enableSwitchAnimation: true,
                      ignorePointers: true,
                      child: ListView.builder(
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
                );
              },
            ),
      ),
    );
  }
}
