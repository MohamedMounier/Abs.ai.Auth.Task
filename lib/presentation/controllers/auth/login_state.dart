part of 'login_bloc.dart';

@immutable
 class LoginState extends Equatable {
  final RequestState requestState;
  final LoginSteps loginSteps;
  final String loginErrorMessage;
  final bool isPasswordVisible;
  final UserCredential? user;
  final UserModel? userModel;
  final String userUid;
  final bool isEmailValid;
  final bool isPasswordValid;

  const LoginState({
    this.requestState = RequestState.isNone,
    this.loginSteps = LoginSteps.isNone,
    this.loginErrorMessage = '',
    this.userUid = '',
    this.userModel ,

    this.isEmailValid=false,
    this.isPasswordValid=false,
    this.isPasswordVisible=true,
    this.user
  });

  LoginState copyWith({
    RequestState? requestState,
    LoginSteps? loginSteps,
    String? loginErrorMessage,
    UserCredential? user,
    bool? isPasswordVisible,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isTrader,
    String? userUid,
  }) =>
      LoginState(requestState: requestState ?? this.requestState,
        loginSteps: loginSteps ?? this.loginSteps,
        loginErrorMessage: loginErrorMessage ?? this.loginErrorMessage,
        user: user??this.user,
        isPasswordVisible: isPasswordVisible??this.isPasswordVisible,
        isEmailValid: isPasswordVisible??this.isEmailValid,
        isPasswordValid: isPasswordVisible??this.isPasswordValid,
        userUid: userUid??this.userUid,
        userModel: userModel??userModel,
      );

  @override
  List<Object> get props => [requestState, loginErrorMessage,loginSteps,isPasswordVisible,userUid];
}

class LoginInitial extends LoginState {}
