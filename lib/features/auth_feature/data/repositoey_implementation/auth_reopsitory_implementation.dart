import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shafi/core/base/base_response.dart';
import 'package:shafi/core/base/base_usecase.dart';
import 'package:shafi/core/services/network/network_client.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/auth_feature/data/models/user_model.dart';
import 'package:shafi/features/auth_feature/domain/entities/user_entity.dart';
import 'package:shafi/features/auth_feature/domain/repository/auth_repository.dart';
import 'package:shafi/features/auth_feature/presentation/controllers/user_controller.dart';

class AuthReopsitoryImplementation extends AuthRepository {
  final NetworkClient networkClient;
  AuthReopsitoryImplementation({required this.networkClient});

  @override
  Future<Either<ErrorModel, UserModel>> login(UserEntity paramters) async {
    NetworkCallType type = NetworkCallType.post;

    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "patients/login",
        data: {"phone": paramters.phone, "password": paramters.password},
        type: type);

    return result.fold((l) => Left(l), (r) {
      try {
        UserModel userModel = UserModel.fromJson(r.data);

        return Right(userModel);
      } catch (e) {
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, UserModel>> refreshToken(
      NoParameters parameters) async {
    NetworkCallType type = NetworkCallType.post;

    Either<ErrorModel, BaseResponse> result =
        await networkClient(url: "patients/refresh", data: {}, type: type);

    return result.fold((l) => Left(l), (r) {
      try {
        UserModel userModel = UserModel.fromJson(r.data);
        return Right(userModel);
      } catch (e) {
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, UserModel>> register(UserEntity paramters) async {
    NetworkCallType type = NetworkCallType.post;

    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "patients/register",
        data: {
          "phone": paramters.phone,
          "password": paramters.password,
          "name": paramters.name,
          "password_confirmation": paramters.confirmPassword
        },
        type: type);

    return result.fold((l) => Left(l), (r) {
      try {
        UserModel userModel = UserModel.fromJson(r.data);

        return Right(userModel);
      } catch (e) {
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, UserModel>> resend(NoParameters parameters) async {
    NetworkCallType type = NetworkCallType.post;
    final ref = ProviderContainer();

    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "patients/resend-verification-code",
        data: {
          "patient_id":
              ref.read(userControllerProvider).requireValue.user!.patient!.id
        },
        type: type);

    return result.fold((l) => Left(l), (r) {
      try {
        UserModel userModel = UserModel.fromJson(r.data);
        return Right(userModel);
      } catch (e) {
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, UserModel>> verifyPhone(String parameters) async {
    NetworkCallType type = NetworkCallType.post;

    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "patients/verify",
        data: {"verification_code": parameters},
        type: type);

    return result.fold((l) => Left(l), (r) {
      try {
        UserModel userModel = UserModel.fromJson(r.data);
        return Right(userModel);
      } catch (e) {
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, List>> forgetPassword(UserEntity parameters) async {
    NetworkCallType type = NetworkCallType.post;

    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "patients/forget-password/send-otp",
        data: {"phone": parameters.phone},
        type: type);

    return result.fold((l) => Left(l), (r) {
      try {
        return Right([]);
      } catch (e) {
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, Map<String, dynamic>>> forgetPasswordVerifyOTP(
      UserEntity parameters) async {
    NetworkCallType type = NetworkCallType.post;

    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "patients/verify-otp",
        data: {"phone": parameters.phone, "otp": parameters.otp},
        type: type);

    return result.fold((l) => Left(l), (r) {
      try {
        return Right(r.data);
      } catch (e) {
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  @override
  Future<Either<ErrorModel, List>> resetPassword(UserEntity parameters) async {
    NetworkCallType type = NetworkCallType.post;

    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "patients/reset-password",
        data: {
          "password": parameters.password,
          "password_confirmation": parameters.confirmPassword,
          "token": "${parameters.Token}"
        },
        type: type);

    return result.fold((l) => Left(l), (r) {
      try {
        return Right(r.data);
      } catch (e) {
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }

  //patients/update-profile
  @override
  Future<Either<ErrorModel, UserModel>> updateProfile(
      UserEntity parameters) async {
    NetworkCallType type = NetworkCallType.post;

    FormData formData = FormData.fromMap({
      "name": parameters.name,
      "email": parameters.email,
      "photo": await MultipartFile.fromFile(parameters.image ?? ""),
    });

    Either<ErrorModel, BaseResponse> result = await networkClient(
        url: "patients/update-profile",
        data: {},
        formData: formData,
        type: type);

    return result.fold((l) => Left(l), (r) {
      try {
        final userModel = UserModel.fromJson(r.data);
        return Right(userModel);
      } catch (e) {
        return Left(ErrorModel(errorMessage: e.toString()));
      }
    });
  }
}
