import 'package:dartz/dartz.dart';
import 'package:shafi/core/base/base_response.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/apointment_feature/domain/entity/confirm_entity.dart';
import 'package:shafi/features/apointment_feature/domain/repository/apointment_repository.dart';

import '../../../../core/base/base_usecase.dart';

class BookingSubmetionUseCase extends BaseUseCase<BaseResponse, ConfirmEntity> {
  final ApointmentRepository apointmentRepository;

  BookingSubmetionUseCase({required this.apointmentRepository});
  /*
  * USE CASE
  * base on BaseUseCase
  * have Call and Call Test
  * it could some operation here before sending data to the Bloc // Cubit // provider // Get x provider
  *
  * */

  @override
  /// Calls the booking submission repository with the given parameters
  /// and returns the result as either an ErrorModel or a BaseResponse.
  ///
  /// The [parameters] parameter is the ConfirmEntity object that is passed
  /// to the booking submission repository.
  ///
  /// The method returns a Future that resolves to either an [ErrorModel]
  /// or a [BaseResponse].
  ///
  /// The method does not throw any errors.
  @override
  Future<Either<ErrorModel, BaseResponse>> call(
      ConfirmEntity parameters) async {
    return await apointmentRepository.bookingsubmetion(parameters: parameters);
  }


  @override
  /// A test variant of the [call] method that calls the
  /// [ApointmentRepository.bookingsubmetion] method with the given
  /// [parameters] and returns the result as either an [ErrorModel]
  /// or a [BaseResponse].
  ///
  /// The method is for testing purposes only and should not be used
  /// in production code.
  @override
  Future<Either<ErrorModel, BaseResponse>> callTest(
      ConfirmEntity parameters) async {
    return await apointmentRepository.bookingsubmetion(parameters: parameters);
  }

}
