enum RequestState {
  isNone,
  isLoading,
  isSucc,
  isError
}
enum RegisterSteps{
  isNone,

  isRegistering,
  isRegisterSuccess,
  isRegisterError,

  isAddingUser,
  isAddedUserSuccess,
  isNotAddedUserError,

}
enum HomeSteps{
  isNone,
  isGettingCurrentUserLoading,
  isGettingCurrentUserSuccess,
  isGettingCurrentUserError,


}
enum LoginSteps{
  isNone,

  isLoginUserIn,
  isLoginUserInError,
  isLoginUserInSuccess,

}
