import 'package:dartz/dartz.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/my_medicens/data/models/medicane_model.dart';
import 'package:shafi/features/my_medicens/domain/repository/repository.dart';

import '../../../../core/base/base_usecase.dart';

class GetMedicalHistoryUseCase
    extends BaseUseCase<List<MedicaneModel>, NoParameters> {
  final MedicalRepository medicalRepository;

  GetMedicalHistoryUseCase({required this.medicalRepository});
  /*
  * USE CASE
  * base on BaseUseCase
  * have Call and Call Test
  * it could some operation here before sending data to the Bloc // Cubit // provider // Get x provider
  
  * */

  @override
  /// This function is the main entry point for the UseCase.
  /// It receives the parameters and calls the underlying repository.
  /// It returns a [Future] with an [Either] that contains the result of the operation.
  /// The [Either] can be either a [Left] with an [ErrorModel] or a [Right] with the list of [MedicaneModel]
  @override
  Future<Either<ErrorModel, List<MedicaneModel>>> call(
      NoParameters parameters) async {
    /// Call the underlying repository to get the medical history
    return await medicalRepository.getMedicalHistory(
        parameters: parameters);
  }

  @override
  /// This function is a test version of the [call] function.
  /// It receives the parameters and calls the underlying repository.
  /// It returns a [Future] with an [Either] that contains the result of the operation.
  /// The [Either] can be either a [Left] with an [ErrorModel] or a [Right] with the list of [MedicaneModel]
  ///
  /// This function is used for testing purpose only and should not be used in production.
  @override
  Future<Either<ErrorModel, List<MedicaneModel>>> callTest(
      NoParameters parameters) async {
    /// Call the underlying repository to get the medical history
    return await medicalRepository.getMedicalHistory(
        parameters: parameters);
  }
}
