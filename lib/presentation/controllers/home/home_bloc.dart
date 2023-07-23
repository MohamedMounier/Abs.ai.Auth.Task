import 'dart:async';

import 'package:abs_ai_auth_task/data/datasource/user_data_source.dart';
import 'package:abs_ai_auth_task/data/repository/auth_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';


import '../../../core/enums/enums.dart';
import '../../../core/error/failure.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repository/user_repo.dart';
import '../../../domain/repository/base_user_repo.dart';
import '../../../domain/usecases/user_use_cases/get_user_by_uid.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserByUidUseCase getUserByUidUseCase=GetUserByUidUseCase(UserRepo(UserRemoteDataSource()));

  HomeBloc() : super(HomeState()) {
   on<GetLoggedInUserByUidEvent>(getUserByLoggedInId);


  }



  FutureOr<void> getUserByLoggedInId(GetLoggedInUserByUidEvent event, Emitter<HomeState> emit)async {
    emit(state.copyWith(homeSteps: HomeSteps.isGettingCurrentUserLoading));
    final result = await getUserByUidUseCase(event.uid);
    result.fold((l) {
      emit(state.copyWith(homeSteps: HomeSteps.isGettingCurrentUserError,requestState: RequestState.isError,homeErrorMsg: l.errorMessage));
    }, (r) {
      emit(state.copyWith(homeSteps: HomeSteps.isGettingCurrentUserSuccess,requestState: RequestState.isSucc,currentUser: r));

    }
    );}



}
