part of 'treatment_plans_controller.dart';

@freezed
abstract class TreatmentPlansState with _$TreatmentPlansState {
  const factory TreatmentPlansState({
    @Default([]) List<TreatmentsPlansModel>? treatmentsPlans,
  }) = _TreatmentPlansState;
}
