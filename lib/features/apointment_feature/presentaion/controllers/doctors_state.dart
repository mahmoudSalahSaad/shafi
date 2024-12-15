part of 'doctors_controller.dart';

@freezed
abstract class DoctorsState with _$DoctorsState {
  factory DoctorsState({
     @Default([]) final List<DoctorModel> doctors , 
     final DoctorModel? selectedDoctor 
  }) = _DoctorsState;
}
