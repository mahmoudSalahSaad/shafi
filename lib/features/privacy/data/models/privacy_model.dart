import 'package:freezed_annotation/freezed_annotation.dart';

part 'privacy_model.freezed.dart';
part 'privacy_model.g.dart';

@freezed
class PrivacyModel with _$PrivacyModel {
  factory PrivacyModel(
      {final String? slug,
      final String? title,
      final String? content,
      final String? image}) = _PrivacyModel;

  factory PrivacyModel.fromJson(Map<String, dynamic> json) =>
      _$PrivacyModelFromJson(json);
}
