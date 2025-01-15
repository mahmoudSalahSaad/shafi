import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/core/utils/alerts.dart';
import 'package:shafi/features/auth_feature/domain/entities/user_entity.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/forgot_password_use_case.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/forgot_password_verify_otp_use_case.dart';

part 'forgot_password_controller.freezed.dart';
part 'forgot_password_controller.g.dart';
part 'forgot_password_state.dart';

@riverpod
class ForgotPasswordController extends _$ForgotPasswordController {
  @override
  Future<ForgotPasswordState> build() async {
    state = AsyncData(ForgotPasswordState());
    return state.requireValue;
  }

  forgetPassword(String phone) async {
    ForgotPasswordUseCase forgotPasswordUseCase = getIt();
    Future.delayed(Duration.zero, () async {
      state = AsyncLoading();
    });

    final result = await forgotPasswordUseCase
        .call(UserEntity(phone: phone, password: ''));

    result.fold((l) {
      Alerts.showSnackBar("${l.errorMessage}");
    }, (r) {
      state = AsyncData(state.requireValue.copyWith(phone: phone));
      NavigationService.push(Routes.otpPassword,
          arguments: {"type": "forgot-password"});
    });
  }

  verifyUser(UserEntity parameters) async {
    ForgotPasswordVerifyOTPUseCase forgotPasswordVerifyOTPUseCase = getIt();
    Future.delayed(Duration.zero, () async {
      state = AsyncLoading();
    });

    final result = await forgotPasswordVerifyOTPUseCase.call(
        UserEntity(phone: parameters.phone, otp: parameters.otp, password: ''));

    result.fold((l) {
      Alerts.showSnackBar("${l.errorMessage}");
    }, (r) {
      state = AsyncData(state.requireValue.copyWith(token: ""));
      NavigationService.push(Routes.resetPassword);
    });
  }
}
