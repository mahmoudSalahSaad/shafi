import 'package:freezed_annotation/freezed_annotation.dart';

part 'medicane_model.freezed.dart';
part 'medicane_model.g.dart';

@freezed
class MedicaneModel with _$MedicaneModel {
  const factory MedicaneModel({
    @JsonKey(name: 'id') int? id,
    @JsonKey(name: 'name') String? name,
    @JsonKey(name: 'description') String? description,
  }) = _MedicaneModel;

  factory MedicaneModel.fromJson(Map<String, dynamic> json) =>
      _$MedicaneModelFromJson(json);
}

