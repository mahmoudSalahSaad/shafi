import 'package:dartz/dartz.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/apointment_feature/data/models/video_call_model.dart';
import 'package:shafi/features/apointment_feature/domain/repository/apointment_repository.dart';

import '../../../../core/base/base_usecase.dart';

class VideoCallRequestUseCase extends BaseUseCase<VideoCallModel, int> {
  final ApointmentRepository apointmentRepository;

  VideoCallRequestUseCase({required this.apointmentRepository});
  /*
  * USE CASE
  * base on BaseUse`Case
  * have Call and Call Test
  * it could some operation here before sending data to the Bloc // Cubit // provider // Get x provider
  */

  @override

  /// The call method for the use case
  ///
  /// This method takes a [int] as a parameter and
  /// returns a [Future] of [Either] containing a [VideoCallModel]
  /// if the call is successful, or an [ErrorModel] if there is an error.
  ///
  /// The call method calls the [requestVideoCall] method from the
  /// [ApointmentRepository] and returns the result.
  @override
  Future<Either<ErrorModel, VideoCallModel>> call(int parameters) async {
    return await apointmentRepository.requestVideoCall(parameters: parameters);
  }

  @override

  /// Test variant for calling the requestVideoCall function from ApointmentRepository
  ///
  /// [parameters] is a [int] object containing the category details.
  ///
  /// Returns a [Future] of [Either] containing a [VideoCallModel]
  /// if the call is successful, or an [ErrorModel] if there is an error.
  Future<Either<ErrorModel, VideoCallModel>> callTest(int parameters) async {
    // Call the requestVideoCall method from the repository with the provided parameters
    return await apointmentRepository.requestVideoCall(parameters: parameters);
  }
}
