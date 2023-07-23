part of 'home_bloc.dart';

@immutable
abstract class HomeEvent extends Equatable{
  const HomeEvent();

}

class GetLoggedInUserByUidEvent extends HomeEvent {

  const GetLoggedInUserByUidEvent(this.uid);

  final String uid;
  @override
  List<Object> get props => [uid];
}
