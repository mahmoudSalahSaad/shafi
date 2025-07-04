part of 'apointment_controller.dart';

@freezed
abstract class ApointmentState with _$ApointmentState {
  factory ApointmentState({
    @Default([]) final List<dynamic> apointmentTimes,
    final String? selectedApointment,
    final String? selectedDate,
    final DoctorModel? selectedDoctor,
    @Default([]) final List<ApointmentModel> myApointments ,
    final String? type , 
    final String? perName , 
    final String? perSsn ,

  }) = _ApointmentState;
}
