import 'package:freezed_annotation/freezed_annotation.dart';

part 'doctor_model.freezed.dart';
part 'doctor_model.g.dart';

@freezed
abstract class DoctorModel with _$DoctorModel {
  factory DoctorModel(
      {final int? id,
      final String? name,
      final String? photo,
      @JsonKey(name: "types_of_appointment")
      @Default([])
      List<String>? typesOfAppointment}) = _DoctorModel;

  factory DoctorModel.fromJson(Map<String, dynamic> json) =>
      _$DoctorModelFromJson(json);
}
