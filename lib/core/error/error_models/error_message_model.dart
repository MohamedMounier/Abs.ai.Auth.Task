import 'package:equatable/equatable.dart';

class ErrorMessageModel extends Equatable {
  final String message;

  const ErrorMessageModel({required this.message,
   });

  factory ErrorMessageModel.fromError({String? message}){
    return ErrorMessageModel(
        message:message??"kindly reopen the application",
     );
  }

  @override
  List<Object> get props => [message];
}

class LocalDataBaseErrorModel extends Equatable {
  final String localErrorMessage;

  const LocalDataBaseErrorModel(this.localErrorMessage);

  @override
  List<Object> get props => [localErrorMessage];
}
