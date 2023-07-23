part of 'register_bloc.dart';

@immutable
abstract class RegisterEvent extends Equatable {
  const RegisterEvent();
}

class GetAdminReportEvent extends RegisterEvent{


  const GetAdminReportEvent();

  @override
  List<Object> get props => [];
}
class RegisterUserEvent extends RegisterEvent{
  final String email;
  final String password;

  const RegisterUserEvent({required this.email, required this.password});

  @override
  List<Object> get props => [email, password];
}
class CreateUserEvent extends RegisterEvent{

  final UserModel userModel;

  const CreateUserEvent(this.userModel);

  @override
  List<Object> get props => [userModel];
}


class ShowPassEvent extends RegisterEvent {
  final bool isPasswordVisible;

  const ShowPassEvent(this.isPasswordVisible);

  @override
  List<Object> get props => [isPasswordVisible];
}
class ValidateEmailAndPasswordEvent extends RegisterEvent {
  final String email;
  final String password;

  const ValidateEmailAndPasswordEvent(this.email,this.password);

  @override
  List<Object> get props => [email,password];
}
