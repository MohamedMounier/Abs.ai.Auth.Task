part of 'register_bloc.dart';

 class RegisterState extends Equatable {
  final RequestState requestState;
  final RegisterSteps registerStep;
  final String registerErrorMessage;
  final bool isUserSaved;
  final bool isPasswordVisible;
  final UserCredential? user;
  final String? userUid;
  final bool isEmailValid;
  final bool isPasswordValid;
   final UserModel? userModel;

  const RegisterState({
    this.requestState = RequestState.isNone,
    this.registerStep = RegisterSteps.isNone,
    this.registerErrorMessage = '',
    this.userUid = '',
    this.userModel ,

    this.isUserSaved=false,
    this.isEmailValid=false,
    this.isPasswordValid=false,
    this.isPasswordVisible=true,
     this.user
  });

  RegisterState copyWith({
    RequestState? requestState,
    RegisterSteps? registerStep,
    String? registerErrorMessage,
    UserCredential? user,
    bool? isPasswordVisible,
    bool? isEmailValid,
    bool? isPasswordValid,
    bool? isTech,
    String? userUid,
    UserModel? userModel,
  }) =>
      RegisterState(requestState: requestState ?? this.requestState,
        registerStep: registerStep ?? this.registerStep,
        registerErrorMessage: registerErrorMessage ?? this.registerErrorMessage,
        user: user??this.user,
        isPasswordVisible: isPasswordVisible??this.isPasswordVisible,
        isEmailValid: isPasswordVisible??this.isEmailValid,
        isPasswordValid: isPasswordVisible??this.isPasswordValid,
        userUid: userUid??this.userUid,
        userModel: userModel??this.userModel,
      );

  @override
  List<Object> get props => [requestState, registerErrorMessage,isUserSaved,registerStep,isPasswordVisible];
}


