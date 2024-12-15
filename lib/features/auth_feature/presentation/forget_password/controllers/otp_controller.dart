import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/core/utils/alerts.dart';
import 'package:shafi/features/auth_feature/data/models/user_model.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/resend_code_use_case.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/verify_phone_use_case.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/features/home_feature/presentation/controllers/get_apointment_dates_controllers.dart';

part 'otp_controller.g.dart';

@riverpod
class OtpController extends _$OtpController {
  @override

  /// Returns an empty string after a successful operation.
  ///
  /// This method is meant to be overridden by the state class.
  ///
  /// Returns an empty string.
  ///
  /// Throws [Exception] if an error occurs.
  Future<String> build() async {
    return '';
  }

  sendOtp({required String otp}) async {
    VerifyPhoneUseCase verifyPhoneUseCase = getIt();
    Future.delayed(Duration.zero, () async {
      state = const AsyncLoading();
    });

    final result = await verifyPhoneUseCase.call(otp);
    result.fold((l) {
      Alerts.showSnackBar("${l.errorMessage}", alertsType: AlertsType.error);

      state = AsyncData("");
    }, (r) async {
      UserModel? userModel =
          await ref.read(userControllerProvider.notifier).getUser();
      if (userModel != null) {
        userModel = userModel.copyWith(patient: r.patient);
      }

      await ref.read(userControllerProvider.notifier).saveUser(userModel!);
      await ref.read(getApointmentDatesControllerProvider.notifier).build();

      NavigationService.pushNamedAndRemoveUntil(Routes.home);
      state = AsyncData("");
    });
  }

  resendCode() async {
    ResendCodeUseCase resendCodeUseCase = getIt();
    Future.delayed(Duration.zero, () async {
      state = AsyncLoading();
    });

    final result = await resendCodeUseCase.call(NoParameters());

    result.fold((l) {
      Alerts.showSnackBar("${l.errorMessage}", alertsType: AlertsType.error);
      state = AsyncData("");
    }, (r) {
      state = AsyncData("");
    });
  }
}
