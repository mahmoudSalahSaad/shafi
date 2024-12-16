import 'package:dartz/dartz.dart';
import 'package:shafi/core/base/base_response.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/core/services/network/network_client.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/my_medicens/data/models/medicane_model.dart';
import 'package:shafi/features/my_medicens/data/models/treatments_plans_model.dart';
import 'package:shafi/features/my_medicens/domain/entity/medicane_entity.dart';
import 'package:shafi/features/my_medicens/domain/repository/repository.dart';

class MedicaneRepositoryImplemention extends MedicalRepository {
  final NetworkClient networkClient;

  MedicaneRepositoryImplemention({required this.networkClient});

  @override
  Future<Either<ErrorModel, MedicaneModel>> addMedicane(
      {required MedicaneEntity parameters}) async {
    NetworkCallType type = NetworkCallType.post;
    Map<String, dynamic> data = {
      "name": parameters.name,
      "description": parameters.description
    };
    Either<ErrorModel, BaseResponse> result =
        await networkClient(url: "medicines", data: data, type: type);

    return result.fold((l) {
      return Left(l);
    }, (r) {
      return Right(MedicaneModel.fromJson(r.data));
    });
  }

  @override

  /// Fetches the medical history of the user
  ///
  /// [parameters] is a NoParameters object, which is a placeholder
  /// for any future parameters that may be needed.
  ///
  /// Returns a list of [MedicaneModel] objects representing the medical history.
  /// If there is an error, returns a [Left] with an [ErrorModel]
  /// containing the error message.
  @override
  Future<Either<ErrorModel, List<MedicaneModel>>> getMedicalHistory(
      {required NoParameters parameters}) async {
    // The type of network call to make (GET, POST, etc.)
    NetworkCallType type = NetworkCallType.get;

    // Make the network call
    Either<ErrorModel, BaseResponse> result =
        await networkClient(url: "medicines", data: {}, type: type);

    // If there is an error, return a [Left] with an [ErrorModel]
    // containing the error message
    return result.fold((l) {
      return Left(l);
    }, (r) {
      // Create a list of [MedicaneModel] objects from the response
      List<MedicaneModel> medicaneList = [];
      for (Map<String, dynamic> item in r.data) {
        medicaneList.add(MedicaneModel.fromJson(item));
      }

      // Return the list of medical history
      return Right(medicaneList);
    });
  }

  @override
  Future<Either<ErrorModel, List<TreatmentsPlansModel>>> getTreatmentPlans(
      {required NoParameters parameters}) async {
    // The type of network call to make (GET, POST, etc.)
    NetworkCallType type = NetworkCallType.get;

    // Make the network call
    Either<ErrorModel, BaseResponse> result =
        await networkClient(url: "treatments", data: {}, type: type);

    // If there is an error, return a [Left] with an [ErrorModel]
    // containing the error message
    return result.fold((l) {
      return Left(l);
    }, (r) {
      // Create a list of [MedicaneModel] objects from the response
      List<TreatmentsPlansModel> medicaneList = [];
      for (Map<String, dynamic> item in r.data) {
        medicaneList.add(TreatmentsPlansModel.fromJson(item));
      }

      // Return the list of medical history
      return Right(medicaneList);
    });
  }
}
