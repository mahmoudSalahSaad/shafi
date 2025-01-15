part of 'forgot_password_controller.dart';

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  factory ForgotPasswordState(
      {final String? otp,
      final String? token,
      final String? phone}) = _ForgotPasswordState;
}
