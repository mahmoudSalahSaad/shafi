import 'package:dartz/dartz.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/my_medicens/data/models/medicane_model.dart';
import 'package:shafi/features/my_medicens/domain/entity/medicane_entity.dart';

abstract class MedicalRepository {
  /// Adds a new medical history entry to the database.
  ///
  /// Accepts a [name] and [description] as parameters and returns a
  /// [Future] containing an [Either] of an [ErrorModel] or a [MedicaneModel].
  /// The [ErrorModel] is returned if an error occurs, while the [MedicaneModel]
  /// is returned if the operation is successful.
  Future<Either<ErrorModel, List<MedicaneModel>>> getMedicalHistory(
      {required NoParameters parameters});

  /// Adds a new medical history entry to the database.
  ///
  /// Accepts a [name] and [description] as parameters and returns a
  /// [Future] containing an [Either] of an [ErrorModel] or a [MedicaneModel].
  /// The [ErrorModel] is returned if an error occurs, while the [MedicaneModel]
  /// is returned if the operation is successful.
  Future<Either<ErrorModel, MedicaneModel>> addMedicane(
      {required MedicaneEntity parameters});
}
