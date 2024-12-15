import 'package:dartz/dartz.dart';
import 'package:shafi/core/base/base_response.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/apointment_feature/data/models/category_model.dart';
import 'package:shafi/features/apointment_feature/data/models/doctor_model.dart';
import 'package:shafi/features/apointment_feature/data/models/questions_model.dart';
import 'package:shafi/features/apointment_feature/data/models/video_call_model.dart';
import 'package:shafi/features/apointment_feature/domain/entity/apointment_times_entity.dart';
import 'package:shafi/features/apointment_feature/domain/entity/category_entity.dart';
import 'package:shafi/features/apointment_feature/domain/entity/confirm_entity.dart';

abstract class ApointmentRepository {
  /// Fetches a list of categories.
  ///
  /// [parameters] is a [NoParameters] object, which is a placeholder
  /// for any future parameters that may be needed.
  ///
  /// Returns a [Future] of [Either] containing a [List] of [CategoryModel]
  /// if the call is successful, or an [ErrorModel] if there is an error.
  Future<Either<ErrorModel, List<CategoryModel>>> getCategory(
      {required NoParameters parameters});

  /// Fetches a list of subcategories for a given category.
  ///
  /// [parameters] is a [CategoryEntity] object containing the category ID
  /// for which subcategories are to be fetched.
  ///
  /// Returns a [Future] of [Either] containing a [List] of [CategoryModel]
  /// if the call is successful, or an [ErrorModel] if there is an error.
  /// Fetches a list of subcategories for a given category.
  ///
  /// [parameters] is a [CategoryEntity] object containing the category ID
  /// for which subcategories are to be fetched.
  ///
  /// Returns a [Future] of [Either] containing a [List] of [CategoryModel]
  /// if the call is successful, or an [ErrorModel] if there is an error.
  Future<Either<ErrorModel, List<CategoryModel>>> getSubCategory(
      {required CategoryEntity parameters});

  /// Fetches a list of doctors.
  ///
  /// [parameters] is a [NoParameters] object, which is a placeholder
  /// for any future parameters that may be needed.
  ///
  /// Returns a [Future] of [Either] containing a [List] of [DoctorModel]
  /// if the call is successful, or an [ErrorModel] if there is an error.
  Future<Either<ErrorModel, List<DoctorModel>>> getDoctors(
      {required ApointmentTimesEntity parameters});

  /// Fetches a list of available times for a given doctor and date.
  ///
  /// [parameters] is an [ApointmentTimesEntity] object containing the
  /// doctor ID and date for which available times are to be fetched.
  ///
  /// Returns a [Future] of [Either] containing a [BaseResponse]
  /// if the call is successful, or an [ErrorModel] if there is an error.
  Future<Either<ErrorModel, BaseResponse>> getBookingAvalibaleTimes(
      {required ApointmentTimesEntity parameters});

  /// Submits a booking request with the provided parameters.
  ///
  /// [parameters] is a [ConfirmEntity] object containing the necessary
  /// information for the booking submission.
  ///
  /// Returns a [Future] of [Either] containing a [BaseResponse] if the
  /// submission is successful, or an [ErrorModel] if there is an error.
  Future<Either<ErrorModel, BaseResponse>> bookingsubmetion(
      {required ConfirmEntity parameters});

  /// Fetches a list of questions for a given category.
  ///
  /// [parameters] is a [CategoryEntity] object containing the category ID
  /// for which questions are to be fetched.
  ///
  /// Returns a [Future] of [Either] containing a [List] of [QuestionsModel]
  /// if the call is successful, or an [ErrorModel] if there is an error.
  Future<Either<ErrorModel, List<QuestionsModel>>> getQuestions(
      {required CategoryEntity parameters});

  /// Requests a video call with the provided parameters.
  ///
  /// [parameters] is a [String] containing the necessary information for the video call request.
  ///
  /// Returns a [Future] of [Either] containing a [List] of [QuestionsModel]
  /// if the request is successful, or an [ErrorModel] if there is an error.
  Future<Either<ErrorModel, VideoCallModel>> requestVideoCall(
      {required int parameters});
}
