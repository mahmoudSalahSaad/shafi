import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/core/services/local/cache_consumer.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/apointment_controller.dart';
import 'package:shafi/features/auth_feature/data/models/user_model.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/features/home_feature/presentation/widgets/home_screen.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_button.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/cutom_shimmer_image.dart';

class BottomNavigationBarScreen extends ConsumerStatefulWidget {
  const BottomNavigationBarScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _BottomNavigationBarScreenState();
}

class _BottomNavigationBarScreenState
    extends ConsumerState<BottomNavigationBarScreen> {
  List<Widget> screens = [
    MyHealthScreen(),
    HomeScreen(),
    PersonalScreen(),
  ];
  Widget selectedScreen = HomeScreen();
  int selectedIndex = 1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: selectedIndex == 1
          ? AppBar(
              backgroundColor: primaryColor,
              leading: InkWell(
                onTap: () async {
                  AppPrefs appPrefs = getIt();
                  await showLangButtomSheet(context, appPrefs);
                  // NavigationService.pushNamedAndRemoveUntil(Routes.init);
                },
                child: Icon(Icons.language),
              ),
            )
          : PreferredSize(preferredSize: Size.zero, child: SizedBox()),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.favorite_border),
            label: S.of(context).my_health,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.add_circle_outlined),
            label: S.of(context).book,
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.personal_injury_outlined),
            label: S.of(context).personal,
          ),
        ],
        currentIndex: selectedIndex,
        onTap: (index) {
          setState(() {
            selectedIndex = index;
            selectedScreen = screens[index];
          });
        },
      ),
      body: SafeArea(
        child: PageView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return selectedScreen;
            },
            itemCount: screens.length),
      ),
    );
  }

  Future<dynamic> showLangButtomSheet(BuildContext context, AppPrefs appPrefs) {
    return showModalBottomSheet(
        context: context,
        builder: (_) {
          return SizedBox(
            height: 210.h,
            width: deviceWidth,
            child: Padding(
              padding: EdgeInsets.all(16.h),
              child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    CustomText(S.of(context).change_language,
                        size: 18.h, bold: true),
                    InkWell(
                      onTap: () async {
                        ref
                            .read(userControllerProvider.notifier)
                            .setLocale("ar");
                        NavigationService.goBack();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            S.of(context).ar,
                            size: 16.h,
                          ),
                          Radio(
                              value: 0,
                              groupValue: ref
                                          .watch(userControllerProvider)
                                          .requireValue
                                          .locale ==
                                      "ar"
                                  ? 0
                                  : 1,
                              onChanged: (val) async {
                                ref
                                    .read(userControllerProvider.notifier)
                                    .setLocale("ar");
                                NavigationService.goBack();
                              })
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        ref
                            .read(userControllerProvider.notifier)
                            .setLocale("en");
                        NavigationService.goBack();
                        // NavigationService.push(Routes.init);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            S.of(context).en,
                            size: 16.h,
                          ),
                          Radio(
                              value: 1,
                              groupValue: ref
                                          .watch(userControllerProvider)
                                          .requireValue
                                          .locale ==
                                      "en"
                                  ? 1
                                  : 0,
                              onChanged: (val) async {
                                ref
                                    .read(userControllerProvider.notifier)
                                    .setLocale("en");
                                NavigationService.goBack();
                              })
                        ],
                      ),
                    ),
                    InkWell(
                      onTap: () async {
                        ref
                            .read(userControllerProvider.notifier)
                            .setLocale("sv");
                        NavigationService.goBack();
                        // NavigationService.push(Routes.init);
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CustomText(
                            "Svenska",
                            size: 16.h,
                          ),
                          Radio(
                              value: 2,
                              groupValue: ref
                                          .watch(userControllerProvider)
                                          .requireValue
                                          .locale ==
                                      "sv"
                                  ? 2
                                  : 0,
                              onChanged: (val) async {
                                ref
                                    .read(userControllerProvider.notifier)
                                    .setLocale("sv");
                                NavigationService.goBack();
                              })
                        ],
                      ),
                    )
                  ]),
            ),
          );
        });
  }
}

class PersonalScreen extends ConsumerWidget {
  const PersonalScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<dynamic> showLangButtomSheet(
        BuildContext context, AppPrefs appPrefs) {
      return showModalBottomSheet(
          context: context,
          builder: (_) {
            return SizedBox(
              height: 154,
              width: deviceWidth,
              child: Padding(
                padding: EdgeInsets.all(16.h),
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CustomText(S.of(context).change_language,
                          size: 18.h, bold: true),
                      InkWell(
                        onTap: () async {
                          ref
                              .read(userControllerProvider.notifier)
                              .setLocale("ar");
                          NavigationService.goBack();
                          // NavigationService.push(Routes.init);
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              S.of(context).ar,
                              size: 16.h,
                            ),
                            Radio(
                                value: 0,
                                groupValue: ref
                                            .watch(userControllerProvider)
                                            .requireValue
                                            .locale ==
                                        "ar"
                                    ? 0
                                    : 1,
                                onChanged: (val) async {
                                  ref
                                      .read(userControllerProvider.notifier)
                                      .setLocale("ar");
                                  NavigationService.goBack();
                                })
                          ],
                        ),
                      ),
                      InkWell(
                        onTap: () async {
                          ref
                              .read(userControllerProvider.notifier)
                              .setLocale("en");
                          // NavigationService.push(Routes.init);
                          NavigationService.goBack();
                        },
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            CustomText(
                              S.of(context).en,
                              size: 16.h,
                            ),
                            Radio(
                                value: 1,
                                groupValue: ref
                                            .watch(userControllerProvider)
                                            .requireValue
                                            .locale ==
                                        "en"
                                    ? 1
                                    : 0,
                                onChanged: (val) async {
                                  ref
                                      .read(userControllerProvider.notifier)
                                      .setLocale("en");
                                  NavigationService.goBack();
                                })
                          ],
                        ),
                      ),
                    ]),
              ),
            );
          });
    }

    final state =
        ref.watch(userControllerProvider).requireValue.user?.patient ??
            Patient();
    return Scaffold(
        backgroundColor: primaryColor,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: EdgeInsets.all(16.h),
            child: Padding(
              padding: EdgeInsets.only(top: 28.h),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ListTile(
                    horizontalTitleGap: 10.w,
                    leading: ClipRRect(
                      borderRadius: BorderRadius.circular(100),
                      child: CustomShimmerImage(
                        image: state.photo ??
                            "https://cdn.pixabay.com/photo/2015/10/05/22/37/blank-profile-picture-973460_1280.png",
                        height: 60.h,
                        width: 60.h,
                        boxFit: BoxFit.cover,
                      ),
                    ),
                    title: CustomText(
                      "${state.name}",
                      size: 16.h,
                      align: TextAlign.start,
                      bold: true,
                    ),
                    subtitle: CustomText(
                      "${state.phone}",
                      align: TextAlign.start,
                      size: 16.h,
                      bold: true,
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 16.w),
                    child: Divider(
                      height: 1.h,
                    ),
                  ),
                  ListTile(
                    onTap: () {
                      NavigationService.push(Routes.updateProfileScreen);
                    },
                    leading: const Icon(Icons.person,
                        size: 20.0, color: Colors.black),
                    trailing: Icon(Icons.arrow_forward_ios, size: 14.h),
                    title: CustomText(
                      S.of(context).update_profile,
                      size: 14.h,
                      align: TextAlign.start,
                      bold: true,
                      white: false,
                    ),
                    textColor: Colors.black,
                    dense: true,

                    // padding: EdgeInsets.zero,
                  ),
                  ListTile(
                    onTap: () {
                      NavigationService.push(Routes.myApointmentScreen);
                    },
                    leading: const Icon(Icons.calendar_month,
                        size: 20.0, color: Colors.black),
                    trailing: Icon(Icons.arrow_forward_ios, size: 14.h),
                    title: CustomText(
                      S.of(context).my_apointments,
                      size: 14.h,
                      align: TextAlign.start,
                      bold: true,
                      white: false,
                    ),
                    textColor: Colors.black,
                    dense: true,

                    // padding: EdgeInsets.zero,
                  ),
                  ListTile(
                    onTap: () {
                      AppPrefs appPrefs = getIt();
                      showLangButtomSheet(context, appPrefs);
                    },
                    leading: const Icon(Icons.language_sharp,
                        size: 20.0, color: Colors.black),
                    trailing: Icon(Icons.arrow_forward_ios, size: 14.h),
                    title: CustomText(
                      S.of(context).change_language,
                      size: 14.h,
                      align: TextAlign.start,
                      bold: true,
                      white: false,
                    ),
                    textColor: Colors.black,
                    dense: true,

                    // padding: EdgeInsets.zero,
                  ),
                  ListTile(
                    onTap: () {
                      NavigationService.push(Routes.privacyScreen);
                    },
                    leading: const Icon(Icons.privacy_tip,
                        size: 20.0, color: Colors.black),
                    trailing: Icon(Icons.arrow_forward_ios, size: 14.h),
                    title: CustomText(
                      S.of(context).privacy_policy,
                      size: 14.h,
                      align: TextAlign.start,
                      bold: true,
                      white: false,
                    ),
                    textColor: Colors.black,
                    dense: true,

                    // padding: EdgeInsets.zero,
                  ),
                  ListTile(
                    onTap: () async {
                      showModalBottomSheet(
                          context: context,
                          builder: (_) {
                            return Padding(
                              padding: EdgeInsets.all(32.h),
                              child: Wrap(
                                spacing: 10.h,
                                runSpacing: 10.h,
                                children: [
                                  CustomText(
                                    S.of(context).delete_account_message,
                                    size: 20.h,
                                  ),
                                  SizedBox(
                                    height: 8.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      CustomButton(
                                        width: 150.w,
                                        buttonText: S.of(context).yes,
                                        textColor: Colors.white,
                                        onTap: () async {
                                          ref
                                              .read(userControllerProvider
                                                  .notifier)
                                              .deleteUser();
                                        },
                                      ),
                                      CustomButton(
                                        width: 150.w,
                                        buttonText: S.of(context).no,
                                        textColor: Colors.white,
                                        backgroundColor: Colors.red,
                                        onTap: () async {
                                          NavigationService.goBack();
                                        },
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            );
                          });
                    },
                    leading: const Icon(Icons.person_remove_alt_1,
                        size: 20.0, color: Colors.black),
                    trailing: Icon(Icons.arrow_forward_ios, size: 14.h),
                    title: CustomText(
                      S.of(context).delete_account,
                      size: 14.h,
                      align: TextAlign.start,
                      bold: true,
                      white: false,
                    ),
                    textColor: Colors.black,
                    dense: true,

                    // padding: EdgeInsets.zero,
                  ),
                  ListTile(
                    onTap: () {
                      ref.read(userControllerProvider.notifier).clearUser();
                      ref.read(userControllerProvider.notifier).clearUser();
                      ref
                          .read(apointmentControllerProvider.notifier)
                          .clearAlldata();
                      NavigationService.pushNamedAndRemoveUntil(Routes.login);
                    },
                    trailing: Icon(Icons.arrow_forward_ios, size: 14.h),
                    leading: const Icon(Icons.logout,
                        size: 20.0, color: Colors.black),
                    title: CustomText(
                      S.of(context).logout,
                      bold: true,
                      size: 14.h,
                      align: TextAlign.start,
                      white: false,
                    ),
                    textColor: Colors.black,
                    dense: true,

                    // padding: EdgeInsets.zero,
                  ),
                ],
              ),
            ),
          ),
        ));
  }
}

class MyHealthScreen extends StatelessWidget {
  const MyHealthScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColor,
      body: SafeArea(
          child: Padding(
        padding:
            EdgeInsets.only(top: 48.h, bottom: 16.h, left: 16.w, right: 16.w),
        child: Column(
          children: [
            ListTile(
              onTap: () {
                NavigationService.push(Routes.medicalHestoryScreen);
              },
              trailing: Icon(Icons.arrow_forward_ios, size: 14.h),
              leading: const Icon(Icons.medical_information,
                  size: 20.0, color: Colors.black),
              title: CustomText(
                S.of(context).my_medicines,
                size: 14.h,
                align: TextAlign.start,
                bold: true,
                white: false,
              ),
              textColor: Colors.black,
              dense: true,

              // padding: EdgeInsets.zero,
            ),
            ListTile(
              onTap: () {
                NavigationService.push(Routes.treatmentPlansScreen);
              },
              trailing: Icon(Icons.arrow_forward_ios, size: 14.h),

              leading: const Icon(Icons.medical_information,
                  size: 20.0, color: Colors.black),
              title: CustomText(
                S.of(context).my_treatment_plans,
                size: 14.h,
                align: TextAlign.start,
                bold: true,
                white: false,
              ),
              textColor: Colors.black,
              dense: true,

              // padding: EdgeInsets.zero,
            ),
          ],
        ),
      )),
    );
  }
}
