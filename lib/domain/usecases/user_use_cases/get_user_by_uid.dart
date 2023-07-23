import 'package:dartz/dartz.dart';
import 'package:abs_ai_auth_task/core/error/failure.dart';
import 'package:abs_ai_auth_task/core/usecases/base_usecases.dart';
import 'package:abs_ai_auth_task/domain/repository/base_user_repo.dart';

import '../../../data/models/user_model.dart';

class GetUserByUidUseCase extends BaseUseCases<UserModel,String>{
  const GetUserByUidUseCase(this._baseUserRepo);
  final BaseUserRepo _baseUserRepo;
  @override
  Future<Either<Failure, UserModel>> call(String uid) {
    return _baseUserRepo.getUserByUid(uid );
  }

}