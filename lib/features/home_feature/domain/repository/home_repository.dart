import 'package:dartz/dartz.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/home_feature/data/models/apointment_model.dart';

abstract class HomeRepository {
  /// Fetches a list of available appointments.
  ///
  /// [parameters] is a NoParameters object, which is a placeholder
  /// for any future parameters that may be needed.
  ///
  /// Returns a list of [ApointmentModel] objects representing the available appointments.
  /// If there is an error, returns a [Left] with an [ErrorModel]
  /// containing the error message.
  Future<Either<ErrorModel, List<ApointmentModel>>> getApointements(
      {required NoParameters parameters});
        /// Fetches a list of available appointment dates.
        ///
        /// [parameters] is a NoParameters object, which is a placeholder
        /// for any future parameters that may be needed.
        ///
        /// Returns a list of [String] objects representing the available dates.
        /// If there is an error, returns a [Left] with an [ErrorModel]
        /// containing the error message.
        Future<Either<ErrorModel, List<String>>> getApointementsDates(
            {required NoParameters parameters});



}
