import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:image_picker/image_picker.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/features/auth_feature/domain/entities/user_entity.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/features/profile/presentation/controllers/update_profile_controller.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_button.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/custom_text_field.dart';

class UpdateProfileScreen extends ConsumerStatefulWidget {
  const UpdateProfileScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _UpdateProfileScreenState();
}

class _UpdateProfileScreenState extends ConsumerState<UpdateProfileScreen> {
  final _fromKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  XFile? image;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _nameController.text =
        ref.read(userControllerProvider).requireValue.user?.patient?.name ?? "";
    _emailController.text =
        ref.read(userControllerProvider).requireValue.user?.patient?.email ??
            "";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: Padding(
        padding: EdgeInsets.only(bottom: 30.h, left: 16.w, right: 16.w),
        child: CustomButton(
          buttonText: S.of(context).save,
          loading: ref.watch(updateProfileControllerProvider).isLoading,
          onTap: () {
            if (_fromKey.currentState!.validate()) {
              ref
                  .read(updateProfileControllerProvider.notifier)
                  .updateProfile(UserEntity(
                    phone: "",
                    password: "",
                    name: _nameController.text,
                    email: _emailController.text,
                    image: image?.path,
                  ));
            }
          },
          textColor: Colors.white,
        ),
      ),
      backgroundColor: primaryColor,
      appBar: AppBar(
        backgroundColor: primaryColor,
        title: CustomText(S.of(context).update_profile),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.h),
        child: SizedBox(
          width: deviceWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              InkWell(
                onTap: () async {
                  final ImagePicker picker = ImagePicker();

                  image = await picker.pickImage(source: ImageSource.gallery);
                  setState(() {});
                },
                child: SizedBox(
                  height: 110.h,
                  width: 110.h,
                  child: Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      Container(
                        height: 102.h,
                        width: 102.h,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                            image: DecorationImage(
                              image: image != null
                                  ? FileImage(File(image!.path))
                                  : NetworkImage(
                                      ref
                                              .watch(userControllerProvider)
                                              .requireValue
                                              .user
                                              ?.patient
                                              ?.photo ??
                                          "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                                    ),
                              fit: BoxFit.cover,
                            ),
                            border:
                                Border.all(color: primaryColorDark, width: 2)),
                      ),
                      Container(
                        padding: EdgeInsets.all(2.h),
                        height: 30.h,
                        width: 30.h,
                        decoration: BoxDecoration(
                          color: primaryColorDark,
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.add,
                            color: Colors.white,
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 50.h,
              ),
              Form(
                key: _fromKey,
                child: Column(
                  children: [
                    CustomTextField(
                      controller: _nameController,
                      isPassword: false,
                      onChange: (str) {
                        _nameController.text = str!;
                        setState(() {});
                      },
                      onValidate: (str) {
                        if (str!.isEmpty) {
                          return S.of(context).field_required;
                        } else {
                          return null;
                        }
                      },
                      hint: S.of(context).patient_name,
                    ),
                    CustomTextField(
                      controller: _emailController,
                      isPassword: false,
                      onChange: (str) {
                        _emailController.text = str!;
                        setState(() {});
                      },
                      onValidate: (str) {
                        if (str!.isEmpty) {
                          return S.of(context).field_required;
                        } else {
                          if (!RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(str)) {
                            return S.of(context).valid_email;
                          } else {
                            return null;
                          }
                        }
                      },
                      prefixIcon: Icon(Icons.email, color: primaryColorDark),
                      hint: S.of(context).email,
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
