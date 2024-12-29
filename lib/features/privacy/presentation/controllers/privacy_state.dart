
part of 'privacy_controller.dart';

@freezed
abstract class PrivacyState with _$PrivacyState {
  factory PrivacyState(
      {final PrivacyModel? privacy,
      }) = _PrivacyState;
}
