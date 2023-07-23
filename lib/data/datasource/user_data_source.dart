import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:abs_ai_auth_task/core/error/error_models/error_message_model.dart';
import 'package:abs_ai_auth_task/core/error/exceptions.dart';
import 'package:abs_ai_auth_task/core/error/failure.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../models/user_model.dart';


abstract class BaseUserRemoteDataSource {
  Future<void> createNewUser({required String uid,required UserModel user});


  Future<DocumentSnapshot>getUserByUid(String userUid);
}

class UserRemoteDataSource implements BaseUserRemoteDataSource {
  @override
  Future<void> createNewUser({required String uid,required UserModel user}) async {
    return await FirebaseFirestore.instance
        .collection("users")
        .doc(uid)
        .set(user.toMap());
  }





  @override
  Future<DocumentSnapshot<Object?>> getUserByUid(String userUid)async {
    return await FirebaseFirestore.instance
        .collection("users").doc(userUid).get();
  }
}
