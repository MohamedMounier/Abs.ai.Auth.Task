import 'dart:async';

import 'package:abs_ai_auth_task/data/datasource/user_data_source.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';


import '../../../core/enums/enums.dart';

import '../../../data/models/user_model.dart';
import '../../../data/repository/user_repo.dart';
import '../../../domain/usecases/user_use_cases/get_user_by_uid.dart';

part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetUserByUidUseCase getUserByUidUseCase=GetUserByUidUseCase(UserRepo(UserRemoteDataSource()));

  HomeBloc() : super(const HomeState()) {
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
