import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/features/apointment_feature/data/models/doctor_model.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/category_controller.dart';
import 'package:shafi/features/apointment_feature/presentaion/screens/doctors_list_screen.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shimmer/shimmer.dart';

class CategoryScreen extends ConsumerWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: primaryColor,
      appBar: AppBar(
        title: CustomText(
          S.of(context).category,
          size: 14.h,
          bold: true,
        ),
        centerTitle: true,
        leading: InkWell(
          onTap: () => NavigationService.goBack(),
          child: Icon(
            Icons.arrow_back_ios_new_rounded,
          ),
        ),
      ),
      body: ref.watch(categoryControllerProvider).when(
          data: (data) {
            return SingleChildScrollView(
              padding: EdgeInsets.all(16.h),
              child: Column(
                children: List.generate(data.categories.length, (index) {
                  return InkWell(
                    onTap: () {
                      ref
                          .read(categoryControllerProvider.notifier)
                          .selectCategory(data.categories[index]);

                      NavigationService.push(Routes.questionsScreen);
                    },
                    child: Container(
                      padding: EdgeInsets.all(10.r),
                      margin: EdgeInsets.only(bottom: 10.h),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        border: Border.all(
                            color:
                                data.selectedCategory == data.categories[index]
                                    ? primaryColorDark
                                    : navIconSelectedDark),
                        borderRadius: BorderRadius.circular(10.r),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withOpacity(0.3),
                              offset: Offset(0, 0),
                              blurRadius: 10),
                        ],
                      ),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                height: 50.h,
                                width: 50.h,
                                child: CachedNetworkImage(
                                    imageUrl:
                                        data.categories[index].image ?? ""),
                              ),
                              CustomText(
                                "${data.categories[index].name}",
                                size: 16.h,
                              ),
                            ],
                          ),
                          Icon(
                            Icons.arrow_forward_ios_rounded,
                          ),
                        ],
                      ),
                    ),
                  );
                }),
              ),
            );
          },
          error: (error, _) => CustomText("$error"),
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
                ),
              )),
    );
  }
}
