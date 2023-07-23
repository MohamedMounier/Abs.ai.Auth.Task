part of 'home_bloc.dart';

@immutable
 class HomeState extends Equatable{
  final RequestState requestState;
  final HomeSteps homeSteps;
  final String homeErrorMsg;
  final UserModel? currentUser;


   HomeState({

    this.requestState = RequestState.isNone,
    this.homeSteps = HomeSteps.isNone,
    this.homeErrorMsg = '',

    this.currentUser
  });

  HomeState copyWith({
    RequestState? requestState,
    String? homeErrorMsg,
    UserModel? currentUser,
    HomeSteps? homeSteps,

  }) =>
      HomeState(requestState: requestState ?? this.requestState,
        homeSteps: homeSteps ?? this.homeSteps,
        homeErrorMsg: homeErrorMsg ?? this.homeErrorMsg,
        currentUser:currentUser??this.currentUser,

      );

  @override
  List<Object> get props => [requestState, homeErrorMsg,homeSteps];
}

