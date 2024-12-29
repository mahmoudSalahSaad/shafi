import 'package:dartz/dartz.dart';
import 'package:shafi/core/base/base_response.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/core/services/network/network_client.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/privacy/data/models/privacy_model.dart';
import 'package:shafi/features/privacy/domain/repo/privacy_repository.dart';

class PrivacyRepositoryImplementatlion extends PrivacyRepository {
  final NetworkClient networkClient;
  PrivacyRepositoryImplementatlion(this.networkClient);
  @override
  Future<Either<ErrorModel, PrivacyModel>> getPrivacy(
      {required NoParameters parameters}) async {
    NetworkCallType type = NetworkCallType.get;

    Either<ErrorModel, BaseResponse> result =
        await networkClient(url: "pages/policy", data: {}, type: type);

    return result.fold((l) => Left(l), (r) {
      try {
        /// If the call is successful, return the response
        PrivacyModel privacyModel = PrivacyModel.fromJson(r.data[0]);
        return Right(privacyModel);
      } catch (e) {
        /// If there is an error, return a [Left] with an [ErrorModel]
        /// containing the error message
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }
}
