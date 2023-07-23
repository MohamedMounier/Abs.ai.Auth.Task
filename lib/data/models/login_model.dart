import 'package:equatable/equatable.dart';

class EmailAndPassEntryModel extends Equatable{
  final String email;

  const EmailAndPassEntryModel({required this.email,required this.password});

  final String password;

  @override
  List<Object> get props => [email, password];
}