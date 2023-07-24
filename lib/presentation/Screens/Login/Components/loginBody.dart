import 'package:abs_ai_auth_task/data/models/login_model.dart';
import 'package:abs_ai_auth_task/presentation/Screens/Register/register.dart';
import 'package:abs_ai_auth_task/presentation/components/buttons.dart';
import 'package:abs_ai_auth_task/presentation/components/custom_snack_bar.dart';
import 'package:abs_ai_auth_task/presentation/controllers/auth/login_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../core/enums/enums.dart';
import '../../../../core/utils/constants.dart';
import '../../../controllers/home/home_bloc.dart';
import '../../HomePage.dart';

class LoginBody extends StatefulWidget {
  const LoginBody({Key? key}) : super(key: key);

  @override
  State<LoginBody> createState() => _LoginBodyState();
}

class _LoginBodyState extends State<LoginBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();

  // TODO: Create Your Variables Here

  @override
  Widget build(BuildContext context) {
    bool emptyArea = false;

    return BlocConsumer<LoginBloc, LoginState>(listener: (context, state) {
      if (state.loginSteps == LoginSteps.isLoginUserInSuccess) {
        showCustomSnackBar(
            context: context,
            isError: false,
            message: "Successfully Logged in ");

        context.read<HomeBloc>().add(
            GetLoggedInUserByUidEvent(state.user!.user?.uid ?? state.userUid));
        Navigator.pushReplacementNamed(context, HomePage.routeName);
      } else if (state.loginSteps == LoginSteps.isLoginUserInError) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(state.loginErrorMessage)));
        showCustomSnackBar(
            context: context,
            isError: false,
            message: "Error Occurred .... ${state.loginErrorMessage}");
      } else if (state.loginSteps == LoginSteps.isLoginUserIn) {
        showCustomSnackBar(
            context: context, isError: false, message: "Logging in ....");
      }
    }, builder: (context, state) {
      return SafeArea(
          child: SingleChildScrollView(
        child: Column(
          children: [
///////////////////////////////////////////////////////////////////////////////////
            Padding(
              padding: const EdgeInsets.only(top: 120).r,
              child: SizedBox(
                width: 260.w,
                child: Column(
                  children: [
                    Text(
                      "Login!",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: mainFontSize.sp,
                        fontWeight: mainFontWeight,
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Text(
                      "Welcome back ! Login with your credentials",
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        fontSize: commonTextSize.sp,
                        color: lightGreyReceiptBG,
                      ),
                    ),
                  ],
                ),
              ),
            ),
///////////////////////////////////////////////////////////////////////////////////

            SizedBox(width: double.infinity.w, height: 40.h),
            Form(
              key: _formKey,
              child: Column(
                children: [
///////////////////////////////////////////////////////////////////////////////////
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0).r,
                    child: SizedBox(
                      width: 220.w,
                      height: 90.h,
                      child: TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            displaySnackBar("enter your email");
                            emptyArea = true;
                            return "empty";
                          }
                          return null;
                        },
                        cursorColor: textBlack,
                        style: TextStyle(fontSize: subFontSize.sp),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: textBlack),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: textBlack),
                          ),
                          icon: const Icon(
                            Icons.email_outlined,
                            color: textBlack,
                          ),
                          labelText: "Email",
                          hintText: "abc@gmail.com",
                          labelStyle: TextStyle(
                              color: textBlack,
                              fontSize: mainFontSize.sp,
                              fontWeight: mainFontWeight),
                          hintStyle: TextStyle(
                              color: textBlack, fontSize: subFontSize.sp),
                        ),
                        onChanged: (text) {
                          // TODO: add your code to fetch the user email
                        },
                      ),
                    ),
                  ),
///////////////////////////////////////////////////////////////////////////////////
                  Padding(
                    padding: const EdgeInsets.only(right: 20.0).r,
                    child: SizedBox(
                      width: 220.w,
                      height: 90.h,
                      child: TextFormField(
                        controller: _userPasswordController,
                        validator: (value) {
                          if (value!.isEmpty) {
                            displaySnackBar("enter your email");
                            emptyArea = true;
                            return "empty";
                          }
                          return null;
                        },
                        cursorColor: textBlack,
                        style: TextStyle(fontSize: subFontSize.sp),
                        decoration: InputDecoration(
                          enabledBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: textBlack),
                          ),
                          focusedBorder: const UnderlineInputBorder(
                            borderSide: BorderSide(color: textBlack),
                          ),
                          icon: const Icon(
                            Icons.password_outlined,
                            color: textBlack,
                          ),
                          labelText: "Password",
                          hintText: "******",
                          labelStyle: TextStyle(
                              color: textBlack,
                              fontSize: mainFontSize.sp,
                              fontWeight: mainFontWeight),
                          hintStyle: TextStyle(
                              color: textBlack, fontSize: subFontSize.sp),
                        ),
                        onChanged: (text) {
                          // TODO: add your code to fetch the user password
                        },
                      ),
                    ),
                  ),
///////////////////////////////////////////////////////////////////////////////////
                  SizedBox(height: 30.h, width: double.infinity.w),
                  DefaultButton(
                      text: "Log in",
                      onPressed: () async {
                        if (_formKey.currentState!.validate()) {
                          emptyArea = false;
                        }
                        if (emptyArea == false) {
                          // TODO: add your code to log in by email & password
                          context.read<LoginBloc>().add(LoginEventLogUserIn(
                              EmailAndPassEntryModel(
                                  email: _emailController.text,
                                  password: _userPasswordController.text)));
                        }
                      }),
///////////////////////////////////////////////////////////////////////////////////
                  SizedBox(height: 20.h, width: double.infinity.w),
                  Text(
                    "Do not have an account ?",
                    style: (TextStyle(
                        color: textBlack, fontSize: commonTextSize.sp)),
                  ),
///////////////////////////////////////////////////////////////////////////////////
                  InkWell(
                    child: Text(
                      'Register',
                      style: TextStyle(
                          color: textBlack,
                          fontSize: commonTextSize.sp,
                          fontWeight: commonTextWeight),
                    ),
                    onTap: () {
                      Navigator.pushNamed(context, Register.routeName);
                    },
                  )
                ],
              ),
            )
          ],
        ),
      ));
    });
  }

// TODO: Create Your Functions Here
}
