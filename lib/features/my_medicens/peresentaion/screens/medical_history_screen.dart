import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/color.dart';
import 'package:shafi/core/resources/values_manager.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/features/my_medicens/domain/entity/medicane_entity.dart';
import 'package:shafi/features/my_medicens/peresentaion/controllers/medicane_controller.dart';
import 'package:shafi/generated/assets.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_button.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/custom_text_field.dart';
import 'package:shimmer/shimmer.dart';

class MedicalHistoryScreen extends ConsumerWidget {
  const MedicalHistoryScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      floatingActionButton: Padding(
        padding: const EdgeInsets.all(8.0),
        child: CustomButton(
          buttonText: S.of(context).add_new_medicine,
          textColor: Colors.white,
          onTap: () {
            final nameEC = TextEditingController();
            final descriptionEC = TextEditingController();
            showDialog(
              context: context,
              builder: (_) {
                return GestureDetector(
                  onTap: () => NavigationService.goBack(),
                  child: Material(
                    color: Colors.white.withOpacity(0),
                    child: Center(
                      child: Container(
                        height: 376.h,
                        width: deviceWidth - 32.w,
                        padding: EdgeInsets.all(16.h),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          image: DecorationImage(
                            image: AssetImage(Assets.medicalPatternJpg),
                            fit: BoxFit.cover,
                            opacity: 0.1,
                          ),
                          borderRadius: BorderRadius.circular(16.r),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            CustomText(
                              S.of(context).add_new_medicine,
                              size: 22.h,
                              bold: true,
                              color: primaryColorDark,
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            CustomTextField(
                              hint: S.of(context).medicine_name,
                              controller: nameEC,
                              onChange: (p0) {
                                nameEC.text = p0 ?? "";
                              },
                              isPassword: false,
                              prefixIcon: Icon(Icons.medication_liquid_rounded),
                            ),
                            SizedBox(
                              height: 150.h,
                              child: CustomTextField(
                                hint: S.of(context).medicine_description,
                                isPassword: false,
                                maxLines: 10,
                                controller: descriptionEC,
                                onChange: (p1) {
                                  descriptionEC.text = p1 ?? "";
                                },
                                prefixIcon: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.all(16.0),
                                      child:
                                          Icon(Icons.medication_liquid_rounded),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 16.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                CustomButton(
                                  buttonText: S.of(context).save,
                                  loading: ref
                                      .watch(medicaneControllerProvider)
                                      .isLoading,
                                  textColor: Colors.white,
                                  backgroundColor: primaryColorDark,
                                  radius: 10.r,
                                  width: 150.w,
                                  height: 44.h,
                                  onTap: () async {
                                    ref
                                        .read(
                                            medicaneControllerProvider.notifier)
                                        .addMedicane(MedicaneEntity(
                                            name: nameEC.text,
                                            description: descriptionEC.text));
                                    NavigationService.goBack();
                                  },
                                ),
                                CustomButton(
                                  buttonText: S.of(context).cancel,
                                  textColor: Colors.white,
                                  backgroundColor: Colors.red,
                                  radius: 10.r,
                                  width: 150.w,
                                  height: 44.h,
                                  onTap: () => NavigationService.goBack(),
                                )
                              ],
                            )
                          ],
                        ),
                      ),
                    ),
                  ),
                );
              },
            );
          },
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      appBar: AppBar(
        title: CustomText("ادويتي", size: 14.h, bold: true),
        centerTitle: true,
        leading: InkWell(
          onTap: () {
            NavigationService.goBack();
          },
          child: Icon(Icons.arrow_back_ios),
        ),
      ),
      body: ref.watch(medicaneControllerProvider).when(
            data: (data) {
              return SizedBox(
                height: deviceHeight,
                width: deviceWidth,
                child: Padding(
                  padding: EdgeInsets.all(16.h),
                  child: ListView.builder(
                    shrinkWrap: true,
                    itemCount: data.medicanes!.length,
                    itemBuilder: (_, index) {
                      return MedicalHistoryItemWidget(
                        title: data.medicanes![index].name,
                        description: data.medicanes![index].description,
                      );
                    },
                  ),
                ),
              );
            },
            error: (error, currentTrace) => Text("$error ,,$currentTrace"),
            loading: () => Shimmer.fromColors(
              baseColor: Colors.grey[300]!,
              highlightColor: Colors.grey[100]!,
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: ListView.builder(
                  shrinkWrap: true,
                  itemCount: 10,
                  itemBuilder: (_, index) {
                    return MedicalHistoryItemWidget();
                  },
                ),
              ),
            ),
          ),
    );
  }
}

class MedicalHistoryItemWidget extends ConsumerStatefulWidget {
  const MedicalHistoryItemWidget({super.key, this.title, this.description});
  final String? title;
  final String? description;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _MedicalHistoryItemWidgetState();
}

class _MedicalHistoryItemWidgetState
    extends ConsumerState<MedicalHistoryItemWidget>
    with SingleTickerProviderStateMixin {
  bool isExpanded = false;
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: Duration(milliseconds: 300),
      reverseDuration: Duration(milliseconds: 300),
      curve: Curves.easeInOut,
      child: InkWell(
        onTap: () {
          setState(() {
            isExpanded = !isExpanded;
          });
        },
        child: Container(
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
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(widget.title ?? "تاريخ المرضى",
                      size: 14.h, bold: true),
                  AnimatedSwitcher(
                    duration: Duration(milliseconds: 400),
                    child: isExpanded
                        ? Icon(Icons.keyboard_arrow_down_rounded)
                        : Icon(Icons.keyboard_arrow_left),
                  ),
                ],
              ),
              if (isExpanded)
                SizedBox(
                  height: 10.h,
                ),
              if (isExpanded)
                CustomText(
                    widget.description ??
                        "asdhkjasndkjhdcnsjhsgfkjsnfajsbcklSNkjldf njasndkjhdcnsjhsgfkjsnfajsbcklSNkjldf njasndkjhdcnsjhsgfkjsnfajsbcklSNkjldf njasndkjhdcnsjhsgfkjsnfajsbcklSNkjldf njasndkjhdcnsjhsgfkjsnfajsbcklSNkjldf njasndkjhdcnsjhsgfkjsnfajsbcklSNkjldf njasndkjhdcnsjhsgfkjsnfajsbcklSNkjldf njasndkjhdcnsjhsgfkjsnfajsbcklSNkjldf njasndkjhdcnsjhsgfkjsnfajsbcklSNkjldf njasndkjhdcnsjhsgfkjsnfajsbcklSNkjldf n المرضى",
                    size: 14.h,
                    bold: false),
            ],
          ),
        ),
      ),
    );
  }
}
