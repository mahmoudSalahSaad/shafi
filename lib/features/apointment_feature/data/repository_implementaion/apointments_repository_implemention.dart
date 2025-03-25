import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:shafi/core/base/base_response.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/core/services/network/network_client.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/apointment_feature/data/models/category_model.dart';
import 'package:shafi/features/apointment_feature/data/models/doctor_model.dart';
import 'package:shafi/features/apointment_feature/data/models/questions_model.dart';
import 'package:shafi/features/apointment_feature/data/models/video_call_model.dart';
import 'package:shafi/features/apointment_feature/domain/entity/apointment_times_entity.dart';
import 'package:shafi/features/apointment_feature/domain/entity/category_entity.dart';
import 'package:shafi/features/apointment_feature/domain/entity/confirm_entity.dart';
import 'package:shafi/features/apointment_feature/domain/repository/apointment_repository.dart';

class ApointmentsRepositoryImplemention extends ApointmentRepository {
  final NetworkClient networkClient;

  ApointmentsRepositoryImplemention({required this.networkClient});

  get dioClient => null;
  @override

  /// Submits a booking request to the server with the given parameters
  ///
  /// [parameters] is a [ConfirmEntity] object containing the booking details
  ///
  /// Returns a [Future] of [Either] containing a [BaseResponse] if the call
  /// is successful, or an [ErrorModel] if there is an error
  Future<Either<ErrorModel, BaseResponse>> bookingsubmetion(
      {required ConfirmEntity parameters}) async {
    /// The type of network call to make
    NetworkCallType type = NetworkCallType.post;

    /// The form data to send with the request
    final dio.FormData formData = dio.FormData();

    /// Add the booking details to the form data
    formData.fields.add(MapEntry("doctor_id", parameters.doctorId.toString()));
    formData.fields.add(MapEntry("date", parameters.date));
    formData.fields.add(MapEntry("start_time", parameters.startTime));
    formData.fields.add(MapEntry("category_id", parameters.categoryId));
    formData.fields.add(MapEntry("subcategory_id", parameters.subCategoryId));
    formData.fields.add(MapEntry("type", parameters.type.toString()));

    /// Add the answers to the form data
    for (int i = 0; i < parameters.answers.length; i++) {
      formData.fields.add(MapEntry("answers[$i][question_id]",
          parameters.answers[i].questionId.toString()));
      formData.fields.add(MapEntry(
          "answers[$i][title]", parameters.answers[i].title.toString()));
      formData.fields.add(MapEntry(
          "answers[$i][answer]", parameters.answers[i].answer.toString()));
    }

    print(formData.fields);

    /// Make the network call
    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "booking/submission", data: {}, type: type, formData: formData);

    /// Process the result of the network call
    return result.fold((l) => Left(l), (r) {
      try {
        return Right(r);
      } catch (e) {
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  @override

  /// Calls the API to fetch available booking times for a given date and doctor
  ///
  /// [parameters] is an [ApointmentTimesEntity] object containing the
  /// appointment date and doctor ID.
  ///
  /// Returns a [Future] containing either an [ErrorModel] or a [BaseResponse].
  Future<Either<ErrorModel, BaseResponse>> getBookingAvalibaleTimes(
      {required ApointmentTimesEntity parameters}) async {
    /// The type of network call to make (POST in this case)
    NetworkCallType type = NetworkCallType.post;

    /// The data to send with the request
    final Map<String, dynamic> data = {
      "day": parameters.apointmentDate,
      "doctor_id": parameters.doctorId,
      "type": parameters.type
    };

    /// Make the network call
    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "booking/available-times", data: data, type: type);

    /// Process the result of the network call
    return result.fold((l) => Left(l), (r) {
      try {
        /// If the call is successful, return the response
        return Right(r);
      } catch (e) {
        /// If there is an error, return a [Left] with an [ErrorModel]
        /// containing the error message
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  @override

  /// Fetches all categories from the API
  ///
  /// Returns a [Future] containing either an [ErrorModel] or a [List] of
  /// [CategoryModel] objects.
  ///
  /// [parameters] is an empty [NoParameters] object because this method does
  /// not require any parameters.
  Future<Either<ErrorModel, List<CategoryModel>>> getCategory(
      {required NoParameters parameters}) async {
    // The type of network call to make (GET in this case)
    NetworkCallType type = NetworkCallType.get;

    // The URL to call and the data to send with the request
    Either<ErrorModel, BaseResponse> result =
        await networkClient(url: "categories", data: {}, type: type);

    // Process the result of the network call
    return result.fold((l) => Left(l), (r) {
      try {
        // If the call is successful, return the response as a list of
        // [CategoryModel] objects
        List<CategoryModel> categories = [];
        for (Map<String, dynamic> item in r.data) {
          categories.add(CategoryModel.fromJson(item));
        }
        return Right(categories);
      } catch (e) {
        // If there is an error, return a [Left] with an [ErrorModel]
        // containing the error message
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  @override

  /// Fetches all doctors from the API
  ///
  /// Returns a [Future] containing either an [ErrorModel] or a [List] of
  /// [DoctorModel] objects.
  ///
  /// [parameters] is an empty [NoParameters] object because this method does
  /// not require any parameters.
  Future<Either<ErrorModel, List<DoctorModel>>> getDoctors(
      {required ApointmentTimesEntity parameters}) async {
    // The type of network call to make (GET in this case)
    NetworkCallType type = NetworkCallType.post;

    // The URL to call and the data to send with the request
    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "booking/available-doctors",
        data: {"day": parameters.apointmentDate},
        type: type);

    // Process the result of the network call
    return result.fold((l) => Left(l), (r) {
      try {
        // If the call is successful, return the response as a list of
        // [DoctorModel] objects
        List<DoctorModel> doctors = [];
        for (Map<String, dynamic> item in r.data) {
          doctors.add(DoctorModel.fromJson(item));
        }
        return Right(doctors);
      } catch (e) {
        // If there is an error, return a [Left] with an [ErrorModel]
        // containing the error message
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  @override

  /// Fetches questions from the API by category ID
  ///
  /// Returns a [Future] containing either an [ErrorModel] or a [List] of
  /// [QuestionsModel] objects.
  ///
  /// [parameters] is a [CategoryEntity] object that contains the category ID
  /// to fetch questions for.
  Future<Either<ErrorModel, List<QuestionsModel>>> getQuestions(
      {required CategoryEntity parameters}) async {
    // The type of network call to make (GET in this case)
    NetworkCallType type = NetworkCallType.get;

    // The URL to call and the data to send with the request
    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "questions/${parameters.categoryId}", data: {}, type: type);

    // Process the result of the network call
    return result.fold((l) => Left(l), (r) {
      try {
        // If the call is successful, return the response as a list of
        // [QuestionsModel] objects
        List<QuestionsModel> questions = [];
        for (Map<String, dynamic> item in r.data) {
          questions.add(QuestionsModel.fromJson(item));
        }
        return Right(questions);
      } catch (e) {
        // If there is an error, return a [Left] with an [ErrorModel]
        // containing the error message
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  @override

  /// Fetches subcategories from the API by category ID
  ///
  /// Returns a [Future] containing either an [ErrorModel] or a [List]
  /// of [CategoryModel] objects.
  ///
  /// [parameters] is a [CategoryEntity] object that contains the category ID
  /// to fetch subcategories for.
  Future<Either<ErrorModel, List<CategoryModel>>> getSubCategory(
      {required CategoryEntity parameters}) async {
    // Define the type of network call to make (GET in this case)
    NetworkCallType type = NetworkCallType.get;

    // Perform the network call with the specified URL and request data
    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "categories/${parameters.categoryId}/children",
        data: {},
        type: type);

    // Process the result of the network call
    return result.fold((l) => Left(l), (r) {
      try {
        // If the call is successful, parse the response into a list of
        // [CategoryModel] objects
        List<CategoryModel> categories = [];
        for (Map<String, dynamic> item in r.data) {
          categories.add(CategoryModel.fromJson(item));
        }
        return Right(categories);
      } catch (e) {
        // If there is an error, return a [Left] with an [ErrorModel]
        // containing the error message
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, VideoCallModel>> requestVideoCall(
      {required int parameters}) async {
// Define the type of network call to make (GET in this case)
    NetworkCallType type = NetworkCallType.post;

    // Perform the network call with the specified URL and request data
    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "video-call/join",
        data: {"appointment_id": parameters},
        type: type);

    // Process the result of the network call
    return result.fold((l) => Left(l), (r) {
      try {
        VideoCallModel model = VideoCallModel.fromJson(r.data);
        return Right(model);
      } catch (e) {
        // If there is an error, return a [Left] with an [ErrorModel]
        // containing the error message
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }
}
