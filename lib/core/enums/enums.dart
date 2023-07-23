enum RequestState {
  isNone,
  isLoading,
  isSucc,
  isError
}
enum RegisterSteps{
  isNone,
  isGettingAdminReport,
  isGettingAdminReportSuccess,
  isGettingAdminReportError,
  isRegistering,
  isRegisterSuccess,
  isRegisterError,
  isAddingUser,
  isAddedUserSuccess,
  isNotAddedUserError,
  isCreatingTech,
  isCreatingTechSuccess,
  isCreatingTechError,
  isUpdatingTechsNumAdminReport,
  isUpdatingTechsNumAdminReportSuccess,
  isUpdatingTechsNumAdminReportError,
}
enum HomeSteps{
  isNone,
  isGettingCurrentUserLoading,
  isGettingCurrentUserSuccess,
  isGettingCurrentUserError,
  isGettingUsersStreamLoading,
  isGettingUsersStreamSuccess,
  isGettingUsersStreamError,

  isGettingTechnicalsLoading,
  isGettingTechnicalsSuccess,
  isGettingTechnicalsError,

  isGettingProjectsLoading,
  isGettingProjectsSuccess,
  isGettingProjectsError,


  isGettingTechMaterialsLoading,
  isGettingTechMaterialsSuccess,
  isGettingTechMaterialsError,

}
enum LoginSteps{
  isNone,
  isUserCheckingTypeFire,
  isUserCheckingTypeFireError,
  isUserCheckingTypeFireSuccess,
  isLoginUserIn,
  isLoginUserInError,
  isLoginUserInSuccess,
  isSavingUserUid,
  isSavingUserUidError,
  isSavingUserUidSuccess,
  isSavingUserType,
  isSavingUserTypeError,
  isSavingUserTypeSuccess,

}


enum TextValidator{
  email,
  password,
  phone,
  name,
  other
}

enum HomeScreenDataSteps{
  isNone,
  isFetchingUserType,
  isFetchingUserTypeSucc,
  isFetchingUserTypeError,
  isFetchingUserUid,
  isFetchingUserUidSucc,
  isFetchingUserUidError,
  isFetchingCars,
  isFetchingCarsSucc,
  isFetchingCarsError,
  isFetchingUserInfo,
  isFetchingUserInfoError,
  isFetchingUserInfoSucc,
}
enum LocalDataStats{
  isNone,
  isRemovingUid,
  isRemovedUidSucc,
  isRemovedUidError,
  isResetingType,
  isResetingTypeSucc,
  isResetingTypeError,
  isLoggingOut,
  isLoggedOutSucc,
  isLoggedOutError,
}