import 'package:dartz/dartz.dart';
import 'package:shafi/data/datasource/remote/exception/error_widget.dart';
import 'package:shafi/features/auth_feature/domain/repository/auth_repository.dart';

import '../../../../core/base/base_usecase.dart';

class RemoveAccountUseCase extends BaseUseCase<List<dynamic>, NoParameters> {
  final AuthRepository authRefreshRepository;

  RemoveAccountUseCase({required this.authRefreshRepository});
  /*
  * USE CASE
  * base on BaseUseCase
  * have Call and Call Test
  * it could some operation here before sending data to the Bloc // Cubit // provider // Get x provider
  *
  * */

  @override
  Future<Either<ErrorModel, List<dynamic>>> call(
      NoParameters parameters) async {
    return await authRefreshRepository.deleteAccount(parameters);
  }

  @override
  Future<Either<ErrorModel, List<dynamic>>> callTest(
      NoParameters parameters) async {
    return await authRefreshRepository.deleteAccount(parameters);
  }
}
