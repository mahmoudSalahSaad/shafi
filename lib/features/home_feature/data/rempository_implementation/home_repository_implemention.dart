import 'package:dartz/dartz.dart';
import 'package:shafi/core/base/base_response.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/core/services/network/network_client.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/home_feature/data/models/apointment_model.dart';
import 'package:shafi/features/home_feature/domain/repository/home_repository.dart';

class HomeRepositoryImplemention extends HomeRepository {
  final NetworkClient networkClient;

  HomeRepositoryImplemention({required this.networkClient});

  @override

  /// Gets a list of appointments for a given patient
  ///
  /// [parameters] is a NoParameters object, which is a placeholder
  /// for any parameters that may be needed in the future.
  ///
  /// Returns a list of [ApointmentModel] objects, which represent
  /// the appointments retrieved from the server.
  ///
  /// If there is an error, returns a [Left] with an [ErrorModel]
  /// containing the error message.
  @override
  /// Gets a list of appointments for a given patient
  ///
  /// [parameters] is a NoParameters object, which is a placeholder
  /// for any parameters that may be needed in the future.
  ///
  /// Returns a list of [ApointmentModel] objects, which represent
  /// the appointments retrieved from the server.
  ///
  /// If there is an error, returns a [Left] with an [ErrorModel]
  /// containing the error message.
  @override
  Future<Either<ErrorModel, List<ApointmentModel>>> getApointements(
      {required NoParameters parameters}) async {
    // The URL for the API endpoint
    String url = "patients/appointments";

    // The data to be sent in the request body
    Map<String, dynamic> data = {};

    // The type of network call to make (GET, POST, etc.)
    NetworkCallType type = NetworkCallType.get;

    // Make the network call
    Either<ErrorModel, BaseResponse> result =
        await networkClient(url: url, data: data, type: type);

    // If there is an error, return it
    return result.fold((l) => Left(l), (r) {
      try {
        // Create a list of [ApointmentModel] objects from the response
        List<ApointmentModel> apointments = [];
        for (Map<String, dynamic> item in r.data) {
          apointments.add(ApointmentModel.fromJson(item));
        }

        // Return the list of appointments
        return Right(apointments);
      } catch (e) {
        // If there is an error, return a [Left] with an [ErrorModel]
        // containing the error message
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  @override
  /// Fetches a list of available appointment dates
  ///
  /// [parameters] is a NoParameters object, which is a placeholder
  /// for any future parameters that may be needed.
  ///
  /// Returns a list of [String] objects representing the available dates.
  /// If there is an error, returns a [Left] with an [ErrorModel]
  /// containing the error message.
  Future<Either<ErrorModel, List<String>>> getApointementsDates(
      {required NoParameters parameters}) async {
    // Define the type of network call
    NetworkCallType type = NetworkCallType.get;

    // Make the network request to the specified URL
    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "booking/available-dates", data: {}, type: type);

    // Process the result of the network call
    return result.fold((l) => Left(l), (r) {
      try {
        // Extract the list of date strings from the response
        List<String> dates = [];
        for (String item in r.data) {
          dates.add(item);
        }
        // Return the list of dates
        return Right(dates);
      } catch (e) {
        // If there is an error during processing, return an error
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }
}
