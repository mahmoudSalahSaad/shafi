import 'package:agora_rtc_engine/agora_rtc_engine.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:shafi/core/extensions/num_extensions.dart';
import 'package:shafi/core/resources/color.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/utils/constants.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/video_call_controller.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/features/home_feature/data/models/apointment_model.dart';
import 'package:shafi/widgets/custom_text.dart';
import 'package:shafi/widgets/tap_effect.dart';
import 'package:wakelock_plus/wakelock_plus.dart';

class VideoCallScreen extends ConsumerStatefulWidget {
  const VideoCallScreen({super.key, required this.apointmentModel});
  final ApointmentModel apointmentModel;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() =>
      _VideoCallScreenState();
}

class _VideoCallScreenState extends ConsumerState<VideoCallScreen> {
  int? _remoteUid;
  bool _localUserJoined = false;
  late RtcEngine _engine;

  bool isMuted = false;

  @override
  void initState() {
    super.initState();
    WakelockPlus.enable();

    initAgora();
  }

  Future<void> initAgora() async {
    String? token = await ref
        .read(videoCallControllerProvider.notifier)
        .requestVideoCall(widget.apointmentModel.id!);
    // retrieve permissions
    await [Permission.microphone, Permission.camera].request();

    //create the engine
    _engine = createAgoraRtcEngine();
    await _engine.initialize(RtcEngineContext(
      appId: Constants.agoraAppId,
    ));

    await _engine
        .setChannelProfile(ChannelProfileType.channelProfileLiveBroadcasting);

    await _engine.setClientRole(role: ClientRoleType.clientRoleBroadcaster);
    await _engine.enableVideo();
    await _engine.startPreview();

    await _engine.joinChannelWithUserAccount(
      token: token!,
      channelId: "agora.${widget.apointmentModel.id}",
      userAccount: ref
          .read(userControllerProvider)
          .requireValue
          .user!
          .patient!
          .id!
          .toString(),
      options: const ChannelMediaOptions(),
    );
    _engine.registerEventHandler(
      RtcEngineEventHandler(
        onJoinChannelSuccess: (RtcConnection connection, int elapsed) {
          debugPrint("local user ${connection.localUid} joined");
          setState(() {
            _localUserJoined = true;
          });
        },
        onUserJoined: (RtcConnection connection, int remoteUid, int elapsed) {
          debugPrint("remote user $remoteUid joined");
          setState(() {
            _remoteUid = remoteUid;
          });
        },
        onUserOffline: (RtcConnection connection, int remoteUid,
            UserOfflineReasonType reason) {
          debugPrint("remote user $remoteUid left channel");
          setState(() {
            _remoteUid = null;
          });
        },
        onTokenPrivilegeWillExpire: (RtcConnection connection, String token) {
          debugPrint(
              '[onTokenPrivilegeWillExpire] connection: ${connection.toJson()}, token: $token');
        },
        onError: (err, msg) => debugPrint('onError: $err, $msg'),
        onExtensionError: (provider, extension, error, message) => debugPrint(
            "[onError] provider: $provider, extension: $extension, error: $error, message: $message"),
        onEncryptionError: (connection, errorType) {
          debugPrint(
              '[onError] connection: ${connection.toJson()}, errorType: $errorType');
        },
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();

    WakelockPlus.disable();

    _dispose();
  }

  Future<void> _dispose() async {
    await _engine.leaveChannel();
    await _engine.release();
  }

  // Create UI with local view and remote view
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: primaryColorDark,
      body: Stack(
        children: [
          Center(
            child: _remoteVideo(),
          ),
          Align(
            alignment: Alignment.topLeft,
            child: SizedBox(
              width: 140,
              height: 200,
              child: Center(
                child: _localUserJoined
                    ? SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(16),
                            child: AgoraVideoView(
                              controller: VideoViewController(
                                rtcEngine: _engine,
                                canvas: VideoCanvas(
                                  uid: 0,
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : const CircularProgressIndicator(),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TapEffect(
                  onClick: () async {
                    setState(() {
                      isMuted = !isMuted;
                    });

                    await _engine.adjustUserPlaybackSignalVolume(
                        uid: ref
                            .read(userControllerProvider)
                            .requireValue
                            .user!
                            .patient!
                            .id!,
                        volume: isMuted ? 0 : 100);
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: primaryColor,
                      shape: BoxShape.circle,
                    ),
                    child: Icon(
                      isMuted ? Icons.mic : Icons.mic_off,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                TapEffect(
                  onClick: () {
                    NavigationService.goBack();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.red,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.call_end,
                      color: Colors.white,
                    ),
                  ),
                ),
                SizedBox(
                  width: 16.w,
                ),
                TapEffect(
                  onClick: () async {
                    await _engine.switchCamera();
                  },
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    margin: EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      shape: BoxShape.circle,
                    ),
                    child: const Icon(
                      Icons.flip_camera_android,
                      color: primaryColor,
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }

  // Display remote user's video
  Widget _remoteVideo() {
    if (_remoteUid != null) {
      return AgoraVideoView(
        controller: VideoViewController.remote(
          rtcEngine: _engine,
          canvas: VideoCanvas(uid: _remoteUid!),
          connection:
              RtcConnection(channelId: "agora.${widget.apointmentModel.id}"),
        ),
      );
    } else {
      return Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.beat(color: primaryColor, size: 60),
          SizedBox(
            height: 12.h,
          ),
          CustomText(
            "برجاء الانتظار",
            size: 20.h,
            color: Colors.white,
            bold: true,
          )
        ],
      );
    }
  }
}
