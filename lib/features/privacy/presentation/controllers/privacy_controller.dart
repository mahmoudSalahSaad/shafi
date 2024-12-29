import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/features/privacy/data/models/privacy_model.dart';
import 'package:shafi/features/privacy/domain/usecases/get_privacy_use_casae.dart';

part 'privacy_controller.freezed.dart';
part 'privacy_controller.g.dart';
part 'privacy_state.dart';

@riverpod
class PrivacyController extends _$PrivacyController {
  @override
  Future<PrivacyState> build() async {
    state = AsyncData(PrivacyState());

    await getPrivacy();

    return state.requireValue;
  }

  getPrivacy() async {
    GetPrivacyUseCasae getPrivacyUseCasae = getIt();
    Future.delayed(Duration.zero, () {
      state = AsyncLoading();
    });
    final result = await getPrivacyUseCasae.call(NoParameters());
    result.fold((l) {
      state = AsyncError(l.errorMessage.toString(), StackTrace.current);
    }, (r) {
      state = AsyncData(state.requireValue.copyWith(privacy: r));
    });
  }
}
