import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shafi/base_injection.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/features/my_medicens/data/models/treatments_plans_model.dart';
import 'package:shafi/features/my_medicens/domain/use_cases/get_treatment_plans_use_case.dart';

part 'treatment_plans_controller.freezed.dart';
part 'treatment_plans_controller.g.dart';
part 'treatment_plans_state.dart';

@riverpod
class TreatmentPlansController extends _$TreatmentPlansController {
  @override

  /// Build the treatment plans controller
  ///
  /// This method is called when the controller is initialized. It
  /// sets the initial state of the controller to [AsyncData] with
  /// an empty [TreatmentPlansState]. Then it calls [getTreatmentPlans]
  /// to get the treatment plans for the user.
  ///
  /// The method returns the state of the controller after the call
  /// to [getTreatmentPlans] is completed.
  ///
  /// If the call is successful, the state is updated with the list of
  /// treatment plans. If the call fails, the state is updated with the
  /// error.
  ///
  /// The returned state is an [AsyncData] containing a [TreatmentPlansState]
  /// object with the list of treatment plans.
  Future<TreatmentPlansState> build() async {
    state = AsyncData(TreatmentPlansState());
    await getTreatmentPlans();

    return state.requireValue;
  }

  /// Get all treatment plans for the user
  ///
  /// This method calls the use case to get the treatment plans and
  /// updates the state with the result of the call.
  ///
  /// If the call is successful, the state is updated with the list of
  /// treatment plans. If the call fails, the state is updated with the
  /// error.
  Future<void> getTreatmentPlans() async {
    // Get the use case
    GetTreatmentPlansUseCase getTreatmentPlansUseCase = getIt();

    // Set the state to loading
    Future.delayed(Duration.zero, () {
      state = AsyncLoading();
    });

    // Call the use case
    final response = await getTreatmentPlansUseCase.call(NoParameters());

    // Handle the response
    response.fold((error) {
      // If the call fails, update the state with the error
      state = AsyncError(error, StackTrace.current);
    }, (medicanes) {
      // If the call is successful, update the state with the list of
      // treatment plans
      state = AsyncData(TreatmentPlansState(treatmentsPlans: medicanes));
    });
  }
}
