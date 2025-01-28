import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/utils/alerts.dart';
import 'package:shafi/features/auth_feature/domain/entities/user_entity.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/update_profile_use_case.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';

part 'update_profile_controller.g.dart';

@riverpod
class UpdateProfileController extends _$UpdateProfileController {
  @override
  Future<void> build() async {
    return;
  }

  updateProfile(UserEntity parameters) async {
    Future.delayed(Duration.zero, () async {
      state = AsyncLoading();
    });
    UpdateProfileUseCase updateProfileUseCase = getIt();
    final result = await updateProfileUseCase.call(parameters);
    result.fold((l) {
      state = AsyncError(l.errorMessage.toString(), StackTrace.current);
      Alerts.showSnackBar("${l.errorMessage}");
    }, (r) {
      ref.read(userControllerProvider.notifier).saveUser(r);
      state = AsyncData(null);
    });
  }
}
