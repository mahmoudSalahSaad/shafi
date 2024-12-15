import 'package:flutter/material.dart';
import 'package:shafi/core/resources/resources.dart';

import '../resources/text_styles.dart';
import '../routing/navigation_services.dart';

enum AlertsType { error, success, info }

class Alerts {
  static void showSnackBar(
    String message, {
    AlertsType alertsType = AlertsType.error,
    Duration duration = const Duration(seconds: 1),
  }) {
    ScaffoldMessenger.of(NavigationService.navigationKey.currentContext!)
        .clearSnackBars();
    ScaffoldMessenger.of(NavigationService.navigationKey.currentContext!)
        .showSnackBar(
      SnackBar(
        // margin: EdgeInsets.only(bottom: 100.0),
        content: Text(
          message,
          style: const TextStyle().regularStyle(),
          textAlign: TextAlign.center,
        ),
        duration: duration,
        // shape: const StadiumBorder(),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(kFormRadius),
        ),

        behavior: SnackBarBehavior.floating,
        backgroundColor: _getColor(alertsType),
        margin: const EdgeInsets.all(kScreenPaddingNormal),
      ),
    );
  }

  static Color _getColor(AlertsType alertsType) {
    switch (alertsType) {
      case AlertsType.error:
        return const Color.fromARGB(255, 194, 33, 33);
      case AlertsType.success:
        return Colors.green;
      case AlertsType.info:
        return Colors.grey;
    }
  }
}
