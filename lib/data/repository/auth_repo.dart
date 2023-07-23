import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:abs_ai_auth_task/core/error/failure.dart';
import 'package:abs_ai_auth_task/data/models/login_model.dart';
import 'package:abs_ai_auth_task/domain/repository/base_auth_repo.dart';

import '../datasource/auth_data_source.dart';

class AuthRepo implements BaseAuthRepo{
  const AuthRepo(this.baseAuthRemoteDataSorUce);

  final BaseAuthRemoteDataSorUce baseAuthRemoteDataSorUce;

  @override
  Future<Either<Failure, UserCredential>> logUserIn({required EmailAndPassEntryModel loginModel})async {
    try {
      var user = await baseAuthRemoteDataSorUce.logUserIn(
          loginModel:loginModel);
      return Right(user);
    } on FirebaseAuthException catch (authError) {
      return Left(ServerFailure(authError.message??'Error'));
    }on FirebaseException catch (error){
      return Left(ServerFailure(error.message!));
    }on Exception catch(error){
      return Left(ServerFailure(error.toString()) );
    }
  }

  @override
  Future<Either<Failure, UserCredential>> createUserWithEmailAndPassword({required EmailAndPassEntryModel
  emailAndPassEntryModel})async {
    try {
      var user = await baseAuthRemoteDataSorUce.createUserWithEmailAndPassword(
          emailAndPassEntryModel: emailAndPassEntryModel);
      return Right(user);
    } on FirebaseAuthException catch (authError) {
      return Left(ServerFailure(authError.message??'Error'));
    }on FirebaseException catch (error){
      return Left(ServerFailure(error.message!));
    }on Exception catch(error){
      return Left(ServerFailure(error.toString()) );
    }
  }

}