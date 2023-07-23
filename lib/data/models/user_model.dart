import 'package:cloud_firestore/cloud_firestore.dart';

///****************************************************
///*** Created by Fady Fouad on 13-Aug-21 at 19:27.***
///****************************************************

class UserModel {
  final String email;
  final String userName;
   String? password;


   UserModel(
      {required this.email,
      required this.userName,
       this.password,

        });



  factory UserModel.fromFirebase(dynamic fireData) {
    return UserModel(
        email: fireData["userEmail"],
        password: fireData["userPassword"],
        userName: fireData["userName"]
    );
  }

  Map<String,dynamic>toMap() => {
    "userEmail":email,
    "userPassword":password,
    "userName":userName,

  };
}
