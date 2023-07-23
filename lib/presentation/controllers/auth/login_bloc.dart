import 'dart:async';

import 'package:abs_ai_auth_task/data/datasource/auth_data_source.dart';
import 'package:abs_ai_auth_task/presentation/Screens/HomePage.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:abs_ai_auth_task/data/models/login_model.dart';
import 'package:abs_ai_auth_task/data/repository/user_repo.dart';

import '../../../core/enums/enums.dart';
import '../../../core/error/failure.dart';
import '../../../data/datasource/user_data_source.dart';
import '../../../data/models/user_model.dart';
import '../../../data/repository/auth_repo.dart';
import '../../../domain/usecases/auth_use_cases/login_fire_use_case.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final LoginFireUseCase loginFireUseCase=LoginFireUseCase(AuthRepo(AuthRemoteDataSource()));
  LoginBloc() : super(LoginState()) {
    on<LoginEventLogUserIn>(onLogin);
    on<ShowPassEvent>(showPassword);
  }


final BaseUserRemoteDataSource _baseUserRemoteDataSource=UserRemoteDataSource();

  FutureOr<void> onLogin(LoginEventLogUserIn event, Emitter<LoginState> emit)async {
    emit(state.copyWith(loginSteps: LoginSteps.isLoginUserIn,requestState: RequestState.isLoading));

    final result =await loginFireUseCase(event.loginModel);
    result.fold((l) {
      emit(state.copyWith(loginSteps: LoginSteps.isLoginUserInError,requestState: RequestState.isLoading,loginErrorMessage: l.errorMessage));
    }, (r) {
      emit(state.copyWith(loginSteps: LoginSteps.isLoginUserInSuccess,requestState: RequestState.isSucc,user: r,userUid: r.user!.uid));

    });
  }

  FutureOr<void> showPassword(ShowPassEvent event, Emitter<LoginState> emit) {
    emit(state.copyWith(isPasswordVisible:event.isPasswordVisible));
  }




void goToHomePage(BuildContext context){
    Navigator.pushReplacementNamed(context, HomePage.routeName);
}



}
