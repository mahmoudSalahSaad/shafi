import 'package:dartz/dartz.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/apointment_feature/data/models/questions_model.dart';
import 'package:shafi/features/apointment_feature/domain/entity/category_entity.dart';
import 'package:shafi/features/apointment_feature/domain/repository/apointment_repository.dart';

import '../../../../core/base/base_usecase.dart';

class GetQuestionUseCase
    extends BaseUseCase<List<QuestionsModel>, CategoryEntity> {
  final ApointmentRepository apointmentRepository;

  GetQuestionUseCase({required this.apointmentRepository});
  /*
  * USE CASE
  * base on BaseUseCase
  * have Call and Call Test
  * it could some operation here before sending data to the Bloc // Cubit // provider // Get x provider
  *
  * */

  @override
  /// The call function for this UseCase
  ///
  /// This function takes a [CategoryEntity] object as a parameter
  /// and returns a [Future] of [Either] containing a [List] of [QuestionsModel]
  /// if the call is successful, or an [ErrorModel] if there is an error.
  ///
  /// The function is a wrapper around the [getQuestions] method from the
  /// [ApointmentRepository] class.
  @override
  Future<Either<ErrorModel, List<QuestionsModel>>> call(
      CategoryEntity parameters) async {
    // Call the getQuestions method from the repository
    return await apointmentRepository.getQuestions(parameters: parameters);
  }

  @override
  /// The test variant for the call function of this UseCase
  ///
  /// This function is a wrapper around the [getQuestions] method from the
  /// [ApointmentRepository] class, and is used for testing purposes only.
  ///
  /// The function takes a [CategoryEntity] object as a parameter
  /// and returns a [Future] of [Either] containing a [List] of [QuestionsModel]
  /// if the call is successful, or an [ErrorModel] if there is an error.
  @override
  Future<Either<ErrorModel, List<QuestionsModel>>> callTest(
      CategoryEntity parameters) async {
    // Call the getQuestions method from the repository
    return await apointmentRepository.getQuestions(parameters: parameters);
  }
}
