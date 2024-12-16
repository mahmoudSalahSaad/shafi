import 'package:dartz/dartz.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/my_medicens/data/models/medicane_model.dart';
import 'package:shafi/features/my_medicens/data/models/treatments_plans_model.dart';
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

  /// Gets the treatment plans for the current user.
  ///
  /// Accepts a [NoParameters] object as a parameter and returns a
  /// [Future] containing an [Either] of an [ErrorModel] or a [List] of
  /// [TreatmentsPlansModel] objects. The [ErrorModel] is returned if an error
  /// occurs, while the [List] of [TreatmentsPlansModel] objects is returned if
  /// the operation is successful.
  ///
  /// The [NoParameters] object is not used in this function and is only
  /// included for consistency with the other functions in this class.
  Future<Either<ErrorModel, List<TreatmentsPlansModel>>> getTreatmentPlans(
      {required NoParameters parameters});
}
