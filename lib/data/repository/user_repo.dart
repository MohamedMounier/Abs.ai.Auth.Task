import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:abs_ai_auth_task/core/error/failure.dart';
import 'package:abs_ai_auth_task/domain/repository/base_user_repo.dart';

import '../datasource/user_data_source.dart';
import '../models/user_model.dart';

class UserRepo implements BaseUserRepo{
 const UserRepo(this._baseUserRemoteDataSource);


  final BaseUserRemoteDataSource _baseUserRemoteDataSource;


  @override
  Future<Either<Failure, void>> createNewUser({required String uid,required UserModel user})async {
    try{
      final result=await _baseUserRemoteDataSource.createNewUser(uid: uid,user: user);
      return Right(result);

    }on FirebaseException catch(error){
      return Left(ServerFailure(error.message??"Server Error Occurred"));
    }
  }





  @override
  Future<Either<Failure, UserModel>> getUserByUid(String userUid)async {
    try{
      final result=await _baseUserRemoteDataSource.getUserByUid(userUid);
      return Right(UserModel.fromFirebase(result.data()));

    }on FirebaseException catch(error){
      return Left(ServerFailure(error.message??"Server Error Occurred"));
    }

  }




}