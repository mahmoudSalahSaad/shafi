part of 'get_apointment_dates_controllers.dart';

@freezed
abstract class GetApointmentDatesState with _$GetApointmentDatesState {
  factory GetApointmentDatesState({
    @Default([]) final List<String> dates,
  }) = _GetApointmentDatesState;
}
