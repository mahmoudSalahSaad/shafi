import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/resources/color.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/generated/l10n.dart';
import 'package:shafi/main.dart';

import 'core/resources/theme/theme.dart';
import 'core/routing/navigation_services.dart';
import 'core/routing/route_generator.dart';

class MyApp extends ConsumerStatefulWidget {
  const MyApp({super.key});

  @override
  ConsumerState<MyApp> createState() => _MyAppState();
}

class _MyAppState extends ConsumerState<MyApp> {
  @override
  void initState() {
    super.initState();
    Future.delayed(Duration.zero, () {
      ref.watch(userControllerProvider);
    });
  }

  @override
  Widget build(BuildContext context) {
    appContext = context;
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: primaryColorDark));
    return Consumer(
      builder: (BuildContext context, WidgetRef ref, Widget? child) {
        final state = ref.watch(userControllerProvider).requireValue;

        return MaterialApp(
          theme: lightTheme,
          color: Theme.of(context).scaffoldBackgroundColor,
          // localizationsDelegates: [
          //   ...context.localizationDelegates,
          // ],
          // supportedLocales: context.supportedLocales,
          // locale: context.locale,

          localizationsDelegates: [
            S.delegate,
            GlobalMaterialLocalizations.delegate,
            GlobalWidgetsLocalizations.delegate,
            GlobalCupertinoLocalizations.delegate,
          ],
          locale: Locale(state.locale ?? "en"),
          supportedLocales: S.delegate.supportedLocales,
          title: 'Shafi',
          debugShowCheckedModeBanner: false,
          navigatorKey: NavigationService.navigationKey,
          initialRoute: Routes.init,
          onGenerateRoute: RouteGenerator.generateBaseRoute,
          builder: (context, child) {
            return child ?? const SizedBox();
          },
        );
      },
    );
  }
}
