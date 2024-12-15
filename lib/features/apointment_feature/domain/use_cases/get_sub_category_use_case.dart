import 'package:dartz/dartz.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/apointment_feature/data/models/category_model.dart';
import 'package:shafi/features/apointment_feature/domain/entity/category_entity.dart';
import 'package:shafi/features/apointment_feature/domain/repository/apointment_repository.dart';

import '../../../../core/base/base_usecase.dart';

class GetSubCategoryUseCase
    extends BaseUseCase<List<CategoryModel>, CategoryEntity> {
  final ApointmentRepository apointmentRepository;

  GetSubCategoryUseCase({required this.apointmentRepository});
  /*
  * USE CASE
  * base on BaseUse`Case
  * have Call and Call Test
  * it could some operation here before sending data to the Bloc // Cubit // provider // Get x provider
  */

  @override
  /// The call method for the use case
  ///
  /// This method takes a [CategoryEntity] as a parameter and
  /// returns a [Future] of [Either] containing a [List] of [CategoryModel]
  /// if the call is successful, or an [ErrorModel] if there is an error.
  ///
  /// The call method calls the [getSubCategory] method from the
  /// [ApointmentRepository] and returns the result.
  @override
  Future<Either<ErrorModel, List<CategoryModel>>> call(
      CategoryEntity parameters) async {
    return await apointmentRepository.getSubCategory(parameters: parameters);
  }

  @override
  /// Test variant for calling the getSubCategory function from ApointmentRepository
  ///
  /// [parameters] is a [CategoryEntity] object containing the category details.
  ///
  /// Returns a [Future] of [Either] containing a [List] of [CategoryModel]
  /// if the call is successful, or an [ErrorModel] if there is an error.
  Future<Either<ErrorModel, List<CategoryModel>>> callTest(
      CategoryEntity parameters) async {
    // Call the getSubCategory method from the repository with the provided parameters
    return await apointmentRepository.getSubCategory(parameters: parameters);
  }
}
