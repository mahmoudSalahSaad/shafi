import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/resources.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/features/privacy/presentation/controllers/privacy_controller.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/indicator.dart';

class PrivacyScreen extends ConsumerWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: CustomText(
          S.of(context).privacy_policy,
          size: 14.h,
          bold: true,
        ),
        centerTitle: true,
        leading: InkWell(
            onTap: () => NavigationService.goBack(),
            child: Icon(
              Icons.arrow_back_ios,
              color: Colors.black,
            )),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(16.h),
        child: SizedBox(
          width: deviceWidth,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ref.watch(privacyControllerProvider).when(
                  data: (data) {
                    return Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomText(
                          "${data.privacy?.title}",
                          size: 14.h,
                          bold: true,
                        ),
                        SizedBox(
                          height: 16.h,
                        ),
                        CustomText("${data.privacy?.content}", size: 12.h),
                      ],
                    );
                  },
                  error: (error, stackTrace) => Text(error.toString()),
                  loading: () => Center(
                        child: MyProgressIndicator(),
                      ))
            ],
          ),
        ),
      ),
    );
  }
}
