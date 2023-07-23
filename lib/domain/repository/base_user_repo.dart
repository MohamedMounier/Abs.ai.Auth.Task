import 'package:dartz/dartz.dart';
import 'package:abs_ai_auth_task/core/error/failure.dart';

import '../../data/models/user_model.dart';

abstract class BaseUserRepo{
  Future<Either<Failure,UserModel>>getUserByUid(String userUid);

  Future<Either<Failure,void>>  createNewUser({required String uid,required UserModel user});



}