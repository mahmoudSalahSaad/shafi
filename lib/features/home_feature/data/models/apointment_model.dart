import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:shafi/features/apointment_feature/data/models/category_model.dart';
import 'package:shafi/features/apointment_feature/data/models/doctor_model.dart';

part 'apointment_model.freezed.dart';
part 'apointment_model.g.dart';

@freezed
abstract class ApointmentModel with _$ApointmentModel {
  factory ApointmentModel({
    final int? id,
    final DoctorModel? doctor,
    final CategoryModel? category,
    final CategoryModel? sub_category,
    final String? date,
    final String? start_time,
    final String? end_time,
    final String ? status , 
    final String? note , 
    final String? agora_channel
  }) = _ApointmentModel;

  factory ApointmentModel.fromJson(Map<String, dynamic> json) =>
      _$ApointmentModelFromJson(json);
}
