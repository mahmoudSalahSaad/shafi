import 'package:dartz/dartz.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/apointment_feature/data/models/doctor_model.dart';
import 'package:shafi/features/apointment_feature/domain/entity/apointment_times_entity.dart';
import 'package:shafi/features/apointment_feature/domain/repository/apointment_repository.dart';

import '../../../../core/base/base_usecase.dart';

class GetDoctorsUseCase extends BaseUseCase<List<DoctorModel>, ApointmentTimesEntity> {
  final ApointmentRepository apointmentRepository;

  GetDoctorsUseCase({required this.apointmentRepository});
  /*
  * USE CASE
  * base on BaseUseCase
  * have Call and Call Test
  * it could some operation here before sending data to the Bloc // Cubit // provider // Get x provider
  *
  * */

  @override
  /// Fetches a list of doctors from the repository
  ///
  /// This method calls the [ApointmentRepository]'s [getDoctors] method with a
  /// [ApointmentTimesEntity] object as the parameter. It does not do any additional
  /// processing or modifications to the data.
  ///
  /// Returns a [Future] containing either an [ErrorModel] on failure or a list of
  /// [DoctorModel] on success.
  @override
  Future<Either<ErrorModel, List<DoctorModel>>> call(
      ApointmentTimesEntity parameters) async {
    // Delegate the call to the repository
    return await apointmentRepository.getDoctors(
        parameters: parameters);
  }


  @override
  /// Test implementation of [call]
  ///
  /// This method is exactly the same as [call], but it is used for testing
  /// purposes. It should not be used in production code.
  ///
  /// [parameters] is a ApointmentTimesEntity object since this call does not require any
  /// additional parameters.
  ///
  /// Returns a [Future] containing either an [ErrorModel] on failure or a list of
  /// [DoctorModel] on success.
  Future<Either<ErrorModel, List<DoctorModel>>> callTest(
      ApointmentTimesEntity parameters) async {
    return await apointmentRepository.getDoctors(
        parameters: parameters);
  }

}
