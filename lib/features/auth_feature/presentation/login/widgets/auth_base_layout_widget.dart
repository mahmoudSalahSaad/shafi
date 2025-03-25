import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:lottie/lottie.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/services/local/cache_consumer.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/generated/assets.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_text.dart';

class AuthBaseLayout extends ConsumerWidget {
  const AuthBaseLayout({
    super.key,
    required this.content,
    this.sideLottie,
    this.title,
    this.discription,
  });
  final Widget content;
  final Lottie? sideLottie;
  final String? title;
  final String? discription;

  @override

  /// Builds the [AuthBaseLayout] widget.
  ///
  /// It includes a [SafeArea] widget which contains a [Stack] widget with two
  /// children: a [Container] which contains the title and description of the
  /// screen, and another [Container] which contains the content of the screen.
  ///
  /// The top [Container] is used to display the title and description of the
  /// screen and it is wrapped in a [Row] widget. The [Row] widget contains two
  /// children: a [Column] widget which contains the title and description, and
  /// a [Lottie] widget which is used to display a Lottie animation.
  ///
  /// The [Column] widget contains three children: a [CustomText] widget which
  /// displays the title of the screen, a [CustomText] widget which displays the
  /// description of the screen, and a [SizedBox] widget which is used to add a
  /// space between the title and description.
  ///
  /// The [Lottie] widget is used to display a Lottie animation. The animation is
  /// loaded from the [Assets.authLottie] asset.
  ///
  /// The bottom [Container] is used to display the content of the screen. It is
  /// wrapped in a [Padding] widget which adds a space at the top of the screen.
  ///
  /// The [content] parameter is used to pass the content of the screen to the
  /// [AuthBaseLayout] widget.
  ///
  /// The [sideLottie] parameter is used to pass a custom Lottie animation to the
  /// [AuthBaseLayout] widget. If this parameter is not provided, the default
  /// Lottie animation is used.
  ///
  /// The [title] parameter is used to pass the title of the screen to the
  /// [AuthBaseLayout] widget. If this parameter is not provided, the default
  /// title is used.
  ///
  /// The [discription] parameter is used to pass the description of the screen
  /// to the [AuthBaseLayout] widget. If this parameter is not provided, the
  /// default description is used.
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    Future<dynamic> showLangButtomSheet(
        BuildContext context, AppPrefs appPrefs) {
      return showModalBottomSheet(
          context: context,
          builder: (_) {
            return SizedBox(
              height: 210,
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

    if (kDebugMode) {
      print("Building AuthBaseLayout widget");
      print("Device width is $deviceWidth and device height is $deviceHeight");
      print("Title is $title and discription is $discription");
      print("Side lottie is $sideLottie");
    }
    return SafeArea(
      child: SizedBox(
        height: deviceHeight,
        width: deviceWidth,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Container(
              width: deviceWidth,
              height: 180.h,
              padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 16.h),
              decoration: BoxDecoration(
                color: AppColorLight().kBottomNavigationBarColor,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 220.w,
                        child: CustomText(
                          title ?? S.of(context).welcome_text,
                          size: 12.h,
                          bold: false,
                          align: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        width: 220.w,
                        child: CustomText(
                          S.of(context).shafi,
                          size: 22.h,
                          bold: true,
                          align: TextAlign.start,
                        ),
                      ),
                      SizedBox(
                        height: 30.h,
                      )
                    ],
                  ),
                  sideLottie ??
                      LottieBuilder.asset(
                        Assets.authLottie,
                        height: 200,
                      ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 160),
              height: deviceHeight,
              decoration: BoxDecoration(
                  color: AppColorLight().kBottomNavigationBarColor,
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(50.r),
                    topRight: Radius.circular(50.r),
                  ),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        offset: Offset(0, 0),
                        blurRadius: 58),
                  ]),
              child: Padding(
                padding: EdgeInsets.only(top: 20.h),
                child: content,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                children: [
                  InkWell(
                    onTap: () async {
                      AppPrefs appPrefs = getIt();
                      await showLangButtomSheet(context, appPrefs);
                      // NavigationService.pushNamedAndRemoveUntil(Routes.init);
                    },
                    child: Icon(Icons.language),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
