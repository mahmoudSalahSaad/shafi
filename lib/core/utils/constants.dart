import 'package:flutter/foundation.dart';

class Constants {
  static const String empty = "";
  static const Duration connectTimeout = kDebugMode
      ? Duration(milliseconds: 15000)
      : Duration(milliseconds: 240000);
  static bool hideForIos = true;
  static String appVersion = "1.0.0";
  static String appName = "Shafi";

  static String agoraAppId = '97f36f9717264cccbbaba86bcbeee250';
  //
  static String accountId = "48a1364d-5e39-4f21-8e1b-d25f5769c5ff";
  static String accountSecret = "@l!mVZ6Ba7KNx";
}
