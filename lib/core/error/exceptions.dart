

import 'error_models/error_message_model.dart';

class FireAuthException implements Exception{
  final ErrorMessageModel errorMessageModel;

  FireAuthException(this.errorMessageModel);
}
class FireStoreException implements Exception{
  final ErrorMessageModel errorMessageModel;

  FireStoreException(this.errorMessageModel);
}
class LocalDataException implements Exception{
  final String errorMessage;

  LocalDataException(this.errorMessage);
}