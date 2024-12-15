import 'package:dartz/dartz.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/apointment_feature/data/models/category_model.dart';
import 'package:shafi/features/apointment_feature/domain/repository/apointment_repository.dart';

import '../../../../core/base/base_usecase.dart';

class GetCategoriesUseCase
    extends BaseUseCase<List<CategoryModel>, NoParameters> {
  final ApointmentRepository apointmentRepository;

  GetCategoriesUseCase({required this.apointmentRepository});
  /*
  * USE CASE
  * base on BaseUseCase
  * have Call and Call Test
  * it could some operation here before sending data to the Bloc // Cubit // provider // Get x provider
  *
  * */

  @override
  /// Call the use case to get the categories from the repository
  ///
  /// [parameters] is a [NoParameters] object, which is a placeholder
  /// for any future parameters that may be needed.
  ///
  /// Returns a [Future] of [Either] containing a [List] of [CategoryModel]
  /// if the call is successful, or an [ErrorModel] if there is an error.
  @override
  Future<Either<ErrorModel, List<CategoryModel>>> call(
      NoParameters parameters) async {
    return await apointmentRepository.getCategory(parameters: parameters);
  }


  @override
  /// Test variant for calling the getCategory function from ApointmentRepository
  ///
  /// [parameters] is a [NoParameters] object, which is a placeholder
  /// for any future parameters that may be needed.
  ///
  /// Returns a [Future] of [Either] containing a [List] of [CategoryModel]
  /// if the call is successful, or an [ErrorModel] if there is an error.
  Future<Either<ErrorModel, List<CategoryModel>>> callTest(
      NoParameters parameters) async {
    // Call the getCategory method from the repository
    return await apointmentRepository.getCategory(parameters: parameters);
  }
}
