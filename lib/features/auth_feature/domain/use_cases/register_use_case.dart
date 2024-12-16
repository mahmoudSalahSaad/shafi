import 'package:dartz/dartz.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/auth_feature/data/models/user_model.dart';
import 'package:shafi/features/auth_feature/domain/entities/user_entity.dart';
import 'package:shafi/features/auth_feature/domain/repository/auth_repository.dart';

import '../../../../core/base/base_usecase.dart';

class RegisterUseCase extends BaseUseCase<UserModel, UserEntity> {
  final AuthRepository authRefreshRepository;

  RegisterUseCase({required this.authRefreshRepository});
  /*
  * USE CASE
  * base on BaseUseCase
  * have Call and Call Test
  * it could some operation here before sending data to the Bloc // Cubit // provider // Get x provider
  *
  * */

  @override
  Future<Either<ErrorModel, UserModel>> call(UserEntity parameters) async {
    return await authRefreshRepository.register(parameters);
  }

  @override
  Future<Either<ErrorModel, UserModel>> callTest(UserEntity parameters) async {
    return await authRefreshRepository.register(parameters);
  }
}
