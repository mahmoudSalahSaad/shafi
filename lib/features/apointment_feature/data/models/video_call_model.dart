import 'package:freezed_annotation/freezed_annotation.dart';

part 'video_call_model.freezed.dart';
part 'video_call_model.g.dart';

@freezed
abstract class VideoCallModel with _$VideoCallModel {
  factory VideoCallModel({final String? token}) = _VideoCallModel;

  factory VideoCallModel.fromJson(Map<String, dynamic> json) =>
      _$VideoCallModelFromJson(json);
}
