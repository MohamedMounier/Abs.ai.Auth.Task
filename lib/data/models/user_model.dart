import 'package:cloud_firestore/cloud_firestore.dart';

///****************************************************
///*** Created by Fady Fouad on 13-Aug-21 at 19:27.***
///****************************************************

class UserModel {
  final String email;
   String? password;


   UserModel(
      {required this.email,
       this.password,

        });



  factory UserModel.fromFirebase(dynamic fireData) {
    return UserModel(
        email: fireData["userEmail"],
        password: fireData["userPassword"]
    );
  }

  Map<String,dynamic>toMap() => {
    "email":email,
    "password":password,

  };
}
