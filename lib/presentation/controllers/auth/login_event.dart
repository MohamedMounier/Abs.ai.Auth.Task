part of 'login_bloc.dart';

@immutable
abstract class LoginEvent extends Equatable {
  const LoginEvent();

}

class LoginEventLogUserIn extends LoginEvent {
  final EmailAndPassEntryModel loginModel;

  const LoginEventLogUserIn(this.loginModel);

  @override
  List<Object> get props => [loginModel];
}

class ValidateEmailAndPassword extends LoginEvent {
  final String email;
  final String password;

  const ValidateEmailAndPassword(this.email,this.password);

  @override
  List<Object> get props => [email,password];
}
class ShowPassEvent extends LoginEvent {
  final bool isPasswordVisible;

  const ShowPassEvent(this.isPasswordVisible);

  @override
  List<Object> get props => [isPasswordVisible];
}
class GetUsersStreamEvent extends LoginEvent {

  const GetUsersStreamEvent();

  @override
  List<Object> get props => [];
}