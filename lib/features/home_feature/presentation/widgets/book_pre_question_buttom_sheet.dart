import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/values_manager.dart';
import 'package:shafi/core/utils/alerts.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/apointment_controller.dart';
import 'package:shafi/features/apointment_feature/presentaion/screens/doctors_list_screen.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_button.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/custom_text_field.dart';

class BookPreQuestionButtomSheet extends ConsumerStatefulWidget {
  const BookPreQuestionButtomSheet({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BookPreQuestionButtomSheetState();
}

class _BookPreQuestionButtomSheetState
    extends ConsumerState<BookPreQuestionButtomSheet> {
  bool hideFields = true;

  int value = 2;
  final TextEditingController ssnController = TextEditingController();
  final TextEditingController nameController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      height: hideFields ? 200.h : 370.h,
      width: deviceWidth,
      padding: EdgeInsets.all(16.h),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(
          top: Radius.circular(20.r),
        ),
      ),
      child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
        CustomText(
          "Booking for someone else ? ",
          size: 20.h,
          bold: true,
        ),
        SizedBox(height: 16.h),
        Row(
          children: [
            InkWell(
              onTap: () {
                setState(() {
                  value = 0;
                  hideFields = false;
                });
              },
              child: Row(
                children: [
                  Radio(
                      value: value,
                      groupValue: 0,
                      onChanged: (val) {
                        setState(() {
                          hideFields = false;
                          value = 0;
                        });
                      }),
                  CustomText(
                    "Yes",
                    size: 16.h,
                    bold: true,
                  ),
                ],
              ),
            ),
            InkWell(
              onTap: () {
                setState(() {
                  value = 1;
                  hideFields = true;
                });
              },
              child: Row(
                children: [
                  Radio(
                      value: value,
                      groupValue: 1,
                      onChanged: (val) {
                        setState(() {
                          value = 1;
                          hideFields = true;
                        });
                      }),
                  CustomText(
                    "No",
                    size: 16.h,
                    bold: true,
                  ),
                ],
              ),
            )
          ],
        ),
        SizedBox(height: 16.h),
        AnimatedSwitcher(
            duration: Duration(milliseconds: 400),
            child: hideFields == false
                ? Form(
                    key: _formKey,
                    child: Column(
                      children: [
                        CustomTextField(
                          controller: ssnController,
                          isPassword: false,
                          hint: S.of(context).enter_ssn,
                          onValidate: (value) {
                            if (value == null) {
                              return S.of(context).field_required;
                            } else {
                              if (value.length != 12) {
                                return S.of(context).valid_ssn;
                              }
                            }
                            return null;
                          },
                        ),
                        CustomTextField(
                          isPassword: false,
                          controller: nameController,
                          onValidate: (p0) {
                            if (p0 == null) {
                              return S.of(context).field_required;
                            }
                            return null;
                          },
                          hint: S.of(context).patient_name,
                        ),
                      ],
                    ),
                  )
                : null),
        CustomButton(
          onTap: () {
            if (value == 0) {
              if (!_formKey.currentState!.validate()) {
                return;
              } else {
                Navigator.pop(context);
                ref
                    .read(apointmentControllerProvider.notifier)
                    .setAppointmentNameAndSsn(
                      name: nameController.text,
                      ssn: ssnController.text,
                    );
                showModalBottomSheet(
                    context: context,
                    builder: (_) {
                      return DoctorsListScreen();
                    });
              }
            } else if (value == 1) {
              Navigator.pop(context);
              showModalBottomSheet(
                  context: context,
                  builder: (_) {
                    return DoctorsListScreen();
                  });
            } else {
              Navigator.pop(context);
              Alerts.showSnackBar(
                "PLease select option",
              );
            }
          },
          textColor: Colors.white,
          buttonText: S.of(context).next,
        ),
      ]),
    );
  }
}
