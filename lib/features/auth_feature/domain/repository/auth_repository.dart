import 'package:dartz/dartz.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/auth_feature/data/models/user_model.dart';
import 'package:shafi/features/auth_feature/domain/entities/user_entity.dart';

abstract class AuthRepository {
  //get home data
  /*
  * add new repo feature  ; 
  * get all characters in home  ;
  * Either returns all characters or return Error model=
  * if no connextion go to no connextion page
  * */

  Future<Either<ErrorModel, UserModel>> login(UserEntity paramters);
  Future<Either<ErrorModel, UserModel>> register(UserEntity paramters);
  Future<Either<ErrorModel, UserModel>> refreshToken(NoParameters parameters);
  Future<Either<ErrorModel, UserModel>> verifyPhone(String parameters);
  Future<Either<ErrorModel, UserModel>> resend(NoParameters parameters);
  Future<Either<ErrorModel, List<dynamic>>> forgetPassword(
      UserEntity parameters);

  Future<Either<ErrorModel, Map<String, dynamic>>> forgetPasswordVerifyOTP(
      UserEntity parameters);
  Future<Either<ErrorModel, List>> resetPassword(UserEntity parameters);
  Future<Either<ErrorModel, UserModel>> updateProfile(UserEntity parameters);
  Future<Either<ErrorModel, List>> deleteAccount(NoParameters parameters);


    Future<Either<ErrorModel, UserModel>> userLoginWithBankId(UserEntity parameters);

}
