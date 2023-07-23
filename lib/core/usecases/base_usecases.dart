import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

import '../error/failure.dart';

abstract class BaseUseCases<T,Parameters> {
  const BaseUseCases();
  Future<Either<Failure,T>> call(Parameters parameters);
}
class NoParameters extends Equatable{

  const NoParameters();

  @override

  List<Object?> get props => [];

}