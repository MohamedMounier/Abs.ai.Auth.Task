import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';

import '../../core/error/failure.dart';
import '../../data/models/login_model.dart';

abstract class BaseAuthRepo {
  Future<Either<Failure,UserCredential>>logUserIn({required EmailAndPassEntryModel loginModel});
  Future<Either<Failure, UserCredential>> createUserWithEmailAndPassword({required EmailAndPassEntryModel emailAndPassEntryModel});

}