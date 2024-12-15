import 'package:dartz/dartz.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/home_feature/domain/repository/home_repository.dart';

import '../../../../core/base/base_usecase.dart';

class GetApointmentDatesUseCase extends BaseUseCase<List<String>, NoParameters> {
  final HomeRepository homeRepository;

  GetApointmentDatesUseCase({required this.homeRepository});

  @override
  /// This function calls the repository to get the available dates for appointments
  ///
  /// It takes [NoParameters] as an argument and returns a [Future] of [Either]
  /// that contains a [List] of [String] representing the dates if the call is
  /// successful, or an [ErrorModel] if an error occurs.
  @override
  Future<Either<ErrorModel, List<String>>> call(NoParameters parameters) async {
    return await homeRepository.getApointementsDates(parameters: parameters);
  }

  @override
  /// This function is a test version of the [call] function. It is used to test
  /// the [GetApointmentDatesUseCase] class without actually calling the
  /// repository.
  ///
  /// It takes a [NoParameters] object as an argument and returns a [Future] of
  /// [Either] that contains a [List] of [String] representing the dates if the
  /// call is successful, or an [ErrorModel] if an error occurs.
  @override
  Future<Either<ErrorModel, List<String>>> callTest(NoParameters parameters) async {
    return await homeRepository.getApointementsDates(parameters: parameters);
  }
}
