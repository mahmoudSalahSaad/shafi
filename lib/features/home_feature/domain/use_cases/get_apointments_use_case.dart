import 'package:dartz/dartz.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/home_feature/data/models/apointment_model.dart';
import 'package:shafi/features/home_feature/domain/repository/home_repository.dart';

import '../../../../core/base/base_usecase.dart';

class GetApointmentsUseCase
    extends BaseUseCase<List<ApointmentModel>, NoParameters> {
  final HomeRepository homeRepository;

  GetApointmentsUseCase({required this.homeRepository});
  /*
  * USE CASE
  * base on BaseUseCase
  * have Call and Call Test
  * it could some operation here before sending data to the Bloc // Cubit // provider // Get x provider
  *
  * */

  @override

  /// This function will be called when the use case is executed.
  /// It will call the [getApointements] function of the [HomeRepository] with the given [parameters].
  /// The result will be returned as a [Either] of [ErrorModel] and [List<ApointmentModel>].
  @override
  Future<Either<ErrorModel, List<ApointmentModel>>> call(
      NoParameters parameters) async {
    /// Call the [getApointements] function of the [HomeRepository] with the given [parameters]
    return await homeRepository.getApointements(parameters: parameters);
  }

  @override

  /// This function is a test variant for fetching appointments.
  /// It will call the [getApointements] function of the [HomeRepository]
  /// with the given [parameters].
  ///
  /// Returns a [Future] containing an [Either] of [ErrorModel] and
  /// [List<ApointmentModel>].
  Future<Either<ErrorModel, List<ApointmentModel>>> callTest(
      NoParameters parameters) async {
    // Call the getApointements function from HomeRepository
    return await homeRepository.getApointements(parameters: parameters);
  }
}
