// ignore_for_file: avoid_print

import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/core/services/local/cache_consumer.dart';
import 'package:shafi/core/services/local/storage_keys.dart';
import 'package:shafi/core/utils/alerts.dart';
import 'package:shafi/core/utils/constants.dart';
import 'package:shafi/core/utils/contact_helper.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/apointment_controller.dart';
import 'package:shafi/features/auth_feature/data/models/user_model.dart';
import 'package:shafi/features/auth_feature/domain/entities/user_entity.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/login_use_case.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/user_login_bank_id_use_case.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/features/home_feature/presentation/controllers/get_apointment_dates_controllers.dart';

part 'login_controller.freezed.dart';
part 'login_controller.g.dart';
part 'login_state.dart';

@riverpod
class LoginController extends _$LoginController {
  @override

  /// Builds the initial login state asynchronously.
  ///
  /// This function initializes the login state with default values.
  /// It sets the state to `AsyncData` containing a new `LoginState` instance.
  /// Returns the current login state.
  Future<LoginState> build() async {
    // Initialize the login state with default values
    state = AsyncData(LoginState());

    // Return the current login state
    return state.requireValue;
  }

  login(UserEntity userCardintials) async {
    Future.delayed(Duration.zero, () {
      state = AsyncLoading();
    });
    LoginUseCase loginUseCase = getIt();
    final result = await loginUseCase.call(userCardintials);
    result.fold((l) {
      Alerts.showSnackBar("${l.errorMessage}", alertsType: AlertsType.error);
      state = AsyncData(state.requireValue);
    }, (r) async {
      AppPrefs appPrefs = getIt();
      await appPrefs.save(PrefKeys.token, r.authorization?.token);

      await ref.read(userControllerProvider.notifier).saveUser(r);
      Future.delayed(Duration.zero, () {
        state = AsyncData(state.requireValue.copyWith(user: r));
      });
      ref.read(apointmentControllerProvider.notifier).getMyApointments();
      ref.read(getApointmentDatesControllerProvider.notifier).build();
      NavigationService.pushNamedAndRemoveUntil(
          Routes.bottomNavigationBarScreen);
    });
  }

  // Other methods and properties...

  loginWithBankId(String ssn) async {
    Future.delayed(Duration.zero, () {
      state = AsyncData(
          state.requireValue.copyWith(isLoginWithBankIdLoading: true));
    });

    Dio dioClient = Dio();

    final String credentials = base64Encode(
        utf8.encode('${Constants.accountId}:${Constants.accountSecret}'));
    final String authorizationHeader = credentials;
    print("authorizationHeader $authorizationHeader");
    Options options = Options(
      headers: {
        "authorization": "basic $authorizationHeader",
      },
      contentType: "application/json",
    );
    //199608061223
    try {
      Response response =
          await dioClient.post("https://api.idkollen.se/v3/bankid-se/auth",
              data: {
                "ssn": ssn,
                "ipAddress": "8.8.8.8",
                "pinRequired": true,
                "intent": "Shafi need to verify your identity",
                "refId": "12111698"
              },
              options: options);
      print("response ${response.data}");
      await ContactHelper.launchURL(
              "https://app.bankid.com/?autostarttoken=${response.data['autoStartToken']}")
          .then((value) async {
        print("nothing herre");
      });

      Future.delayed(Duration(seconds: 15), () async {
        await checkLoginStatus(response.data['id']);
      });
    } on DioError catch (e) {
      state = AsyncData(
          state.requireValue.copyWith(isLoginWithBankIdLoading: false));
      if (e.response != null) {
        print("Dio error!");
        print("STATUS: ${e.response?.statusCode}");
        print("DATA: ${e.response?.data}");
        print("HEADERS: ${e.response?.headers}");
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print("Error sending request!");
        print(e.message);
      }
    } catch (e) {
      print("Unexpected error: $e");
    }
  }

  checkLoginStatus(String id) async {
    Dio dioClient = Dio();

    final String credentials = base64Encode(
        utf8.encode('${Constants.accountId}:${Constants.accountSecret}'));
    final String authorizationHeader = credentials;
    print("authorizationHeader $authorizationHeader");
    Options options = Options(
      headers: {
        "authorization": "basic $authorizationHeader",
      },
      contentType: "application/json",
    );

    try {
      Response response = await dioClient.get(
          "https://api.idkollen.se/v3/bankid-se/auth/$id",
          options: options);
      print("response12 ${response.data}");

      if (response.data['status'] == "COMPLETED") {
        await requestLoginWithBankId(
            ssnNumber: response.data['ssn'], fullName: response.data['name']);
      } else {
        state = AsyncData(
            state.requireValue.copyWith(isLoginWithBankIdLoading: false));
      }
    } on DioError catch (e) {
      state = AsyncData(
          state.requireValue.copyWith(isLoginWithBankIdLoading: false));
      if (e.response != null) {
        print("Dio error!");
        print("STATUS: ${e.response?.statusCode}");
        print("DATA: ${e.response?.data}");
        print("HEADERS: ${e.response?.headers}");
      } else {
        // Something happened in setting up or sending the request that triggered an Error
        print("Error sending request!");
        print(e.message);
      }
    } catch (e) {
      print("Unexpected error: $e");
    }
  }

  requestLoginWithBankId(
      {required String ssnNumber, required String fullName}) async {
    UserLoginBankIdUseCase loginUseCase = getIt();
    final result = await loginUseCase
        .call(UserEntity(phone: ssnNumber, password: "", email: fullName));
    result.fold((l) {
      state = AsyncData(
          state.requireValue.copyWith(isLoginWithBankIdLoading: false));
      Alerts.showSnackBar("${l.errorMessage}", alertsType: AlertsType.error);
    }, (r) async {
      state = AsyncData(
          state.requireValue.copyWith(isLoginWithBankIdLoading: true));
      AppPrefs appPrefs = getIt();
      await appPrefs.save(PrefKeys.token, r.authorization?.token);

      await ref.read(userControllerProvider.notifier).saveUser(r);
      Future.delayed(Duration.zero, () {
        state = AsyncData(state.requireValue.copyWith(user: r));
      });
      ref.read(apointmentControllerProvider.notifier).getMyApointments();
      ref.read(getApointmentDatesControllerProvider.notifier).build();
      NavigationService.pushNamedAndRemoveUntil(
          Routes.bottomNavigationBarScreen);
    });
  }

  // Future<void> loginWithBankId() async {
  //   final String accountId = Constants.accountId;
  //   final String secretKey = Constants.accountSecret;
  //   final String credentials =
  //       base64Encode(utf8.encode('$accountId:$secretKey'));
  //   final String authorizationHeader = 'Basic $credentials';

  //   final response = await http.post(
  //     Uri.parse('https://stgapi.idkollen.se/v3/bankid-se/auth'),
  //     headers: {
  //       'Content-Type': "application/x-www-form-urlencoded",
  //       "Accept": "*/*",
  //       "Accept-Encoding": "gzip, deflate, br",
  //       "Connection": "keep-alive",
  //       'Authorization': authorizationHeader
  //     },
  //     body: {
  //       'ssn': '196711254257',
  //       'ipAddress': '8.8.8.8',
  //       'pinRequired': 'true',
  //       'intent': 'Intention text',
  //       'refId': '12111698',
  //     },
  //   );

  //   if (response.statusCode == 200) {
  //     // Request was successful
  //     print('Response data: ${response.body}');
  //   } else {
  //     // Request failed
  //     print('Request failed with status: ${response.statusCode}');
  //     print('Response body: ${response.body}');
  //   }
  // }
}
