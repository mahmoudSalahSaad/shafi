import 'package:dartz/dartz.dart';
import 'package:shafi/core/base/base_response.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/apointment_feature/domain/entity/apointment_times_entity.dart';
import 'package:shafi/features/apointment_feature/domain/repository/apointment_repository.dart';

import '../../../../core/base/base_usecase.dart';

class GetBookingAvalibaleTimesUseCase
    extends BaseUseCase<BaseResponse, ApointmentTimesEntity> {
  final ApointmentRepository apointmentRepository;

  GetBookingAvalibaleTimesUseCase({required this.apointmentRepository});
  /*
  * USE CASE
  * base on BaseUseCase
  * have Call and Call Test
  * it could some operation here before sending data to the Bloc // Cubit // provider // Get x provider
  *
  * */

  @override
  /// Calls the repository to fetch available booking times
  ///
  /// [parameters] is an [ApointmentTimesEntity] object containing the
  /// appointment date and doctor ID.
  ///
  /// Returns a [Future] containing either an [ErrorModel] or a [BaseResponse].
  Future<Either<ErrorModel, BaseResponse>> call(ApointmentTimesEntity parameters) async {
    // Delegate the call to the repository method
    return await apointmentRepository.getBookingAvalibaleTimes(
        parameters: parameters);
  }

  @override
  /// Calls the repository to fetch available booking times for testing
  /// purposes.
  ///
  /// [parameters] is an [ApointmentTimesEntity] object containing the
  /// appointment date and doctor ID.
  ///
  /// Returns a [Future] containing either an [ErrorModel] or a [BaseResponse].
  @override
  Future<Either<ErrorModel, BaseResponse>> callTest(
      ApointmentTimesEntity parameters) async {
    return await apointmentRepository.getBookingAvalibaleTimes(
        parameters: parameters);
  }
}
