import 'dart:async';

import 'package:abs_ai_auth_task/data/datasource/auth_data_source.dart';
import 'package:abs_ai_auth_task/data/datasource/user_data_source.dart';
import 'package:abs_ai_auth_task/data/repository/auth_repo.dart';
import 'package:abs_ai_auth_task/data/repository/user_repo.dart';
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:abs_ai_auth_task/data/models/login_model.dart';

import '../../../core/enums/enums.dart';
import '../../../data/models/user_model.dart';
import '../../../domain/usecases/auth_use_cases/register_fire_use_case.dart';
import '../../../domain/usecases/user_use_cases/create_user_use_case.dart';

part 'register_event.dart';
part 'register_state.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterState> {
  final RegisterFireBaseUseCase registerFireBaseUseCase=RegisterFireBaseUseCase(AuthRepo(AuthRemoteDataSource()));
  final CreateUserUseCase createUserUseCase=CreateUserUseCase(UserRepo(UserRemoteDataSource()));

  RegisterBloc() : super(const RegisterState()) {
    on<RegisterUserEvent>(onRegister);
    on<CreateUserEvent>(createUser);

  }


  FutureOr<void> onRegister(RegisterUserEvent event, Emitter<RegisterState> emit)async {
    emit(state.copyWith(registerStep: RegisterSteps.isRegistering,requestState: RequestState.isLoading));

    final registerResult =await registerFireBaseUseCase(EmailAndPassEntryModel(email: event.email, password: event.password));
    registerResult.fold((l) {
      emit(state.copyWith(registerStep: RegisterSteps.isRegisterError,requestState: RequestState.isError,registerErrorMessage: l.errorMessage));
    }, (r) {
      emit(state.copyWith(registerStep: RegisterSteps.isRegisterSuccess,requestState: RequestState.isLoading,user: r,userUid: r.user!.uid));


    });
  }

  FutureOr<void> showPassword(ShowPassEvent event, Emitter<RegisterState> emit) {
    emit(state.copyWith(isPasswordVisible:event.isPasswordVisible));
  }







  FutureOr<void> createUser(CreateUserEvent event, Emitter<RegisterState> emit)async {
    emit(state.copyWith(registerStep: RegisterSteps.isAddingUser,requestState: RequestState.isLoading));
    final creationResult = await createUserUseCase(CreateUserUseCaseParams(event.userModel, state.user!.user!.uid));
    creationResult.fold((l) {
      emit(state.copyWith(registerStep: RegisterSteps.isNotAddedUserError,requestState: RequestState.isError,registerErrorMessage: l.errorMessage));

    }, (r) {
      emit(state.copyWith(registerStep: RegisterSteps.isAddedUserSuccess,requestState: RequestState.isSucc));
    });
  }
}
