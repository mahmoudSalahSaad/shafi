import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/routing/navigation_services.dart';
import 'package:shafi/core/routing/routes.dart';
import 'package:shafi/core/services/local/cache_consumer.dart';
import 'package:shafi/core/services/local/storage_keys.dart';
import 'package:shafi/core/utils/alerts.dart';
import 'package:shafi/features/apointment_feature/presentaion/controllers/apointment_controller.dart';
import 'package:shafi/features/auth_feature/data/models/user_model.dart';
import 'package:shafi/features/auth_feature/domain/entities/user_entity.dart';
import 'package:shafi/features/auth_feature/domain/use_cases/login_use_case.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';
import 'package:shafi/features/home_feature/presentation/controllers/get_apointment_dates_controllers.dart';

part 'login_controller.freezed.dart';
part 'login_controller.g.dart';
part 'login_state.dart';

@riverpod
class LoginController extends _$LoginController {
  @override

  /// Builds the initial login state asynchronously.
  ///
  /// This function initializes the login state with default values.
  /// It sets the state to `AsyncData` containing a new `LoginState` instance.
  /// Returns the current login state.
  Future<LoginState> build() async {
    // Initialize the login state with default values
    state = AsyncData(LoginState());

    // Return the current login state
    return state.requireValue;
  }

  login(UserEntity userCardintials) async {
    Future.delayed(Duration.zero, () {
      state = AsyncLoading();
    });
    LoginUseCase loginUseCase = getIt();
    final result = await loginUseCase.call(userCardintials);
    result.fold((l) {
      Alerts.showSnackBar("${l.errorMessage}", alertsType: AlertsType.error);
      state = AsyncData(state.requireValue);
    }, (r) async {
      AppPrefs appPrefs = getIt();
      await appPrefs.save(PrefKeys.token, r.authorization?.token);

      await ref.read(userControllerProvider.notifier).saveUser(r);
      Future.delayed(Duration.zero, () {
        state = AsyncData(state.requireValue.copyWith(user: r));
      });
      ref.read(apointmentControllerProvider.notifier).getMyApointments();
      ref.read(getApointmentDatesControllerProvider.notifier).build();
      NavigationService.pushNamedAndRemoveUntil(
          Routes.bottomNavigationBarScreen);
    });
  }
}
