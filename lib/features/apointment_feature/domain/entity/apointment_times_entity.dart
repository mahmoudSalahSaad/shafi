import 'package:equatable/equatable.dart';

class ApointmentTimesEntity extends Equatable {
  final int doctorId;
  final String apointmentDate;

  const ApointmentTimesEntity(
      {required this.doctorId, required this.apointmentDate});
  @override
  List<Object> get props => [doctorId, apointmentDate];
}
