import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/core/utils/alerts.dart';
import 'package:shafi/features/auth_feature/data/models/user_model.dart';
import 'package:shafi/features/auth_feature/domain/entities/user_entity.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/register_use_case.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';

part 'register_controller.freezed.dart';
part 'register_controller.g.dart';
part 'register_state.dart';

@riverpod
class RegisterController extends _$RegisterController {
  @override
  /// Initializes the [RegisterController] with a default value of [RegisterState].
  ///
  /// This is a future because it's used in [riverpod]'s [FutureProvider].
  @override
  Future<RegisterState> build() async {
    /// The initial state of the [RegisterController] is a success state with a default value of [RegisterState],
    /// because the [RegisterController] is used in [FutureProvider] and it needs to return a future.
    state = AsyncData(RegisterState());
    return state.requireValue;
  }


  register(UserEntity userCardintials) async {
    Future.delayed(Duration.zero, () => state = AsyncLoading());
    RegisterUseCase registerUseCase = getIt();
    final result = await registerUseCase.call(userCardintials);
    result.fold((l) {
      Alerts.showSnackBar("${l.errorMessage}", alertsType: AlertsType.error);
      state = AsyncData(state.requireValue);
    }, (r) async {
      state = AsyncData(state.requireValue.copyWith(user: r));
      await ref.read(userControllerProvider.notifier).saveUser(r);
      NavigationService.push(Routes.otpPassword);
    });
  }
}
