import 'package:dartz/dartz.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/privacy/data/models/privacy_model.dart';

abstract class PrivacyRepository {
  Future<Either<ErrorModel, PrivacyModel>> getPrivacy(
      {required NoParameters parameters});
}
