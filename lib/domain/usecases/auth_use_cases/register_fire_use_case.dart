import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:abs_ai_auth_task/core/error/failure.dart';
import 'package:abs_ai_auth_task/core/usecases/base_usecases.dart';
import 'package:abs_ai_auth_task/data/models/login_model.dart';
import 'package:abs_ai_auth_task/domain/repository/base_auth_repo.dart';

class RegisterFireBaseUseCase implements BaseUseCases<UserCredential,EmailAndPassEntryModel>{
 const RegisterFireBaseUseCase(this.baseAuthRepo);

  final BaseAuthRepo baseAuthRepo;

  @override
  Future<Either<Failure, UserCredential>> call(EmailAndPassEntryModel emailAndPassEntryModel)async {
  return await baseAuthRepo.createUserWithEmailAndPassword(emailAndPassEntryModel: emailAndPassEntryModel);
  }

}