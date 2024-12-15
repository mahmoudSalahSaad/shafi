part of 'video_call_controller.dart';

@freezed
abstract class VideoCallState with _$VideoCallState {
  factory VideoCallState({
    final  String?  token   
  }) = _VideoCallState;
}
