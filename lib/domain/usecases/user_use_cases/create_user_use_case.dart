import 'package:dartz/dartz.dart';
import 'package:abs_ai_auth_task/core/error/failure.dart';
import 'package:abs_ai_auth_task/core/usecases/base_usecases.dart';
import 'package:abs_ai_auth_task/domain/repository/base_user_repo.dart';
import 'package:equatable/equatable.dart';

import '../../../data/models/user_model.dart';
import '../../repository/base_user_repo.dart';

class CreateUserUseCase extends BaseUseCases<void, CreateUserUseCaseParams> {
  const CreateUserUseCase(this._baseUserRepo);

  final BaseUserRepo _baseUserRepo;

  @override
  Future<Either<Failure, void>> call(CreateUserUseCaseParams caseParams) {
    return _baseUserRepo.createNewUser(uid: caseParams.uid,user: caseParams.userModel);
  }


}

class CreateUserUseCaseParams extends Equatable {
  final UserModel userModel;
  final String uid;

  const CreateUserUseCaseParams(this.userModel, this.uid);

  @override
  List<Object> get props => [userModel, uid];
}