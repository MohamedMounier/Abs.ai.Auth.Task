
///****************************************************
///*** Created by Mohamed Mounier on 24-Aug-23 .***
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
