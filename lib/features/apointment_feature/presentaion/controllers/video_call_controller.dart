import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/features/apointment_feature/domain/use_cases/video_call_request_use_case.dart';

part 'video_call_controller.freezed.dart';
part 'video_call_controller.g.dart';
part 'video_call_state.dart';

@Riverpod(keepAlive: true)
class VideoCallController extends _$VideoCallController {
  @override

  /// Returns a [Future] of [VideoCallState] containing the initial state of the video call controller.
  ///
  /// The initial state is [VideoCallState] with an empty [token] field.
  ///
  /// This function is called by [Riverpod] to build the initial state of the provider.
  Future<VideoCallState> build() async {
    /// The initial state is an empty [VideoCallState]
    state = AsyncData(VideoCallState());
    return state.requireValue;
  }

  Future<String?> requestVideoCall(int channel) async {
    VideoCallRequestUseCase videroCallRequestUseCase = getIt();

    final result = await videroCallRequestUseCase.call(channel);
    result.fold((l) {
      state = AsyncError(l.errorMessage.toString(), StackTrace.current);
    }, (r) {
      state = AsyncData(state.requireValue.copyWith(token: r.token));
    });
    return state.requireValue.token;
  }
}
