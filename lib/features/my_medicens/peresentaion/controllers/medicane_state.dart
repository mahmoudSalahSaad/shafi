part of 'medicane_controller.dart';

@freezed
abstract class MedicaneState with _$MedicaneState {
  factory MedicaneState({@Default([]) final List<MedicaneModel>? medicanes}) =
      _MedicaneState;
}
