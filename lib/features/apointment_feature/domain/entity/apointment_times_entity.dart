import 'package:equatable/equatable.dart';

class ApointmentTimesEntity extends Equatable {
  final int doctorId;
  final String apointmentDate;
  final String? type;
  const ApointmentTimesEntity(
      {required this.doctorId, required this.apointmentDate, this.type});
  @override
  List<Object> get props => [doctorId, apointmentDate];
}
