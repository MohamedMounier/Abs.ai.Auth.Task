
import 'package:firebase_auth/firebase_auth.dart';

import '../models/login_model.dart';


abstract class BaseAuthRemoteDataSorUce {
  Future<UserCredential>logUserIn({required EmailAndPassEntryModel loginModel});
  Future<UserCredential>createUserWithEmailAndPassword({required EmailAndPassEntryModel emailAndPassEntryModel});
  Future<void> logUserOut();
}

class AuthRemoteDataSource implements BaseAuthRemoteDataSorUce{


  @override
  Future<UserCredential> logUserIn({required EmailAndPassEntryModel loginModel})async {
    return  await FirebaseAuth.instance.signInWithEmailAndPassword(email: loginModel.email, password: loginModel.password);

  }


  @override
  Future<void> logUserOut()async {
    await FirebaseAuth.instance.signOut();

  }


  @override
  Future<UserCredential> createUserWithEmailAndPassword({required EmailAndPassEntryModel emailAndPassEntryModel})async {
    return  await FirebaseAuth.instance.createUserWithEmailAndPassword(email:emailAndPassEntryModel.email, password: emailAndPassEntryModel.password);

  }

}