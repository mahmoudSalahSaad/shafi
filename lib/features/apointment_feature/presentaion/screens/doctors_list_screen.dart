import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/features/apointment_feature/data/models/doctor_model.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/doctors_controller.dart';
import 'package:shafi/generated/assets.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';

class DoctorsListScreen extends ConsumerWidget {
  const DoctorsListScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: ref.watch(doctorsControllerProvider).when(
            data: (data) {
              return ListView.builder(
                shrinkWrap: true,
                padding: EdgeInsets.symmetric(vertical: 16.h),
                itemCount: data.doctors.length,
                itemBuilder: (_, index) {
                  return DoctorCardWidget(
                    doctorModel: data.doctors[index],
                  );
                },
              );
            },
            error: (e, strrError) => Text("$e"),
            loading: () => Shimmer.fromColors(
                baseColor: Colors.grey.shade200,
                highlightColor: Colors.grey.shade300,
                child: Padding(
                  padding: EdgeInsets.all(16.0.h),
                  child: Column(
                    children: List.generate(10, (index) {
                      return DoctorCardWidget(
                          doctorModel: DoctorModel(name: "Loading.........."));
                    }),
                  ),
                ))),
      ),
    );
  }
}

class DoctorCardWidget extends ConsumerWidget {
  const DoctorCardWidget({
    super.key,
    required this.doctorModel,
    this.isLoading = false,
  });
  final DoctorModel doctorModel;
  final bool? isLoading;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return GestureDetector(
      onTap: () {
        ref
            .read(doctorsControllerProvider.notifier)
            .selectdoctor(doctor: doctorModel);
      },
      child: Container(
        padding: EdgeInsets.all(10.h),
        margin: EdgeInsets.only(right: 16.w, left: 16.w, bottom: 16.h),
        decoration: BoxDecoration(
          color: isLoading! ? Colors.transparent : AppColorLight().kAppBarColor,
          borderRadius: BorderRadius.circular(10.r),
          boxShadow: [
            BoxShadow(
                color: Colors.black.withOpacity(0.2),
                offset: Offset(0, 0),
                blurRadius: 10),
          ],
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                Container(
                  height: 40.h,
                  width: 40.h,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: primaryColor),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SvgPicture.asset(
                        Assets.doctorSvg,
                        color: primaryColor,
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  width: 10.w,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      "${doctorModel.name}",
                      size: 14.h,
                      color: primaryColorDark,
                    ),
                    CustomText(
                      "عام",
                      size: 14.h,
                      color: primaryColorDark,
                    )
                  ],
                )
              ],
            ),
            Icon(
              Icons.arrow_forward_ios,
              color: primaryColorDark,
            )
          ],
        ),
      ),
    );
  }
}
