import 'package:freezed_annotation/freezed_annotation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
abstract class UserModel with _$UserModel {
  factory UserModel(
      {final Patient? patient,
      final Authorization? authorization}) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);
}

@freezed
abstract class Patient with _$Patient {
  factory Patient(
      {final int? id,
      final String? name,
      final String? phone,
      final String? address,
      final bool? is_active,
     @Default(false) final bool? is_phone_verified}) = _Patient;

  factory Patient.fromJson(Map<String, dynamic> json) =>
      _$PatientFromJson(json);
}

@freezed
abstract class Authorization with _$Authorization {
  factory Authorization({final String? token}) = _Authorization;

  factory Authorization.fromJson(Map<String, dynamic> json) =>
      _$AuthorizationFromJson(json);
}
