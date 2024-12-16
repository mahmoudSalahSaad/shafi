import 'package:freezed_annotation/freezed_annotation.dart';

part 'treatments_plans_model.freezed.dart';
part 'treatments_plans_model.g.dart';

@freezed
class TreatmentsPlansModel with _$TreatmentsPlansModel {
  const factory TreatmentsPlansModel({
    int? id,
    String? name,
    @JsonKey(name: 'start_date') String? startDate,
    @JsonKey(name: 'end_date') String? endDate,
    String? doctor,
    String? instructions,
    String? medicine,
    String? notes,
  }) = _TreatmentsPlansModel;

  factory TreatmentsPlansModel.fromJson(Map<String, dynamic> json) =>
      _$TreatmentsPlansModelFromJson(json);
}
