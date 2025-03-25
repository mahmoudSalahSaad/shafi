part of 'user_controller.dart';

@freezed
abstract class UserState with _$UserState {
  factory UserState(
      {final UserModel? user,
      @Default("ar") final String? locale ,  final String? country}) = _UserState;
}
