import 'package:abs_ai_auth_task/core/utils/constants.dart';
import 'package:abs_ai_auth_task/presentation/components/buttons.dart';
import 'package:abs_ai_auth_task/presentation/controllers/auth/register_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter/material.dart';
import '../../../../core/enums/enums.dart';
import '../../../../data/models/user_model.dart';
import '../../../components/custom_snack_bar.dart';
import '../../Login/login.dart';

class RegisterBody extends StatefulWidget {
  const RegisterBody({Key? key}) : super(key: key);

  @override
  State<RegisterBody> createState() => _RegisterBodyState();
}

class _RegisterBodyState extends State<RegisterBody> {
  final _formKey = GlobalKey<FormState>();
  final TextEditingController _emailController=TextEditingController();
  final TextEditingController _userPasswordController=TextEditingController();
  final TextEditingController _userNameController=TextEditingController();
  @override
  Widget build(BuildContext context) {
    bool emptyArea = false;

    return BlocListener<RegisterBloc,RegisterState>(
        listener: (context, state) {
          if (state.requestState == RequestState.isError) {
            showCustomSnackBar(context: context, isError: true, message: state.registerErrorMessage);

          }
          if (state.requestState == RequestState.isLoading) {
            showCustomSnackBar(context: context, isError: false, message: "Loading...${state.registerStep}");

          }
          if(state.registerStep==RegisterSteps.isRegisterSuccess){
            showCustomSnackBar(context: context, isError: false, message: "Successfully Done ...${state.registerStep}");

            context.read<RegisterBloc>().add(CreateUserEvent( UserModel(
              userName: _userNameController.text,
                email: _emailController.text,
                password:
                _userPasswordController.text,
             )));
          }
          if (state.registerStep == RegisterSteps.isAddedUserSuccess) {
            showCustomSnackBar(context: context, isError: false, message: "Successfully Done ...${state.registerStep}");

            Navigator.pushReplacementNamed(context, Login.routeName);

          }




        },

child: SafeArea(
    child: SingleChildScrollView(
      child: Column(
        children: [
///////////////////////////////////////////////////////////////////////////////////
          Padding(
            padding: const EdgeInsets.only(top: 50).r,
            child: SizedBox(
              width: 260.w,
              child: Column(
                children: [
                  Text(
                    "Register Now!",
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
                    "Create an Account,Its free",
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
                      controller: _userNameController,
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
                          Icons.person,
                          color: textBlack,
                        ),
                        labelText: "User Name",
                        hintText: "Ahmed Mohamed",
                        labelStyle: TextStyle(
                            color: textBlack,
                            fontSize: mainFontSize.sp,
                            fontWeight: mainFontWeight),
                        hintStyle: TextStyle(
                            color: textBlack, fontSize: subFontSize.sp),
                      ),
                      onChanged: (text){
                        // TODO: add your code to add User Name in firestore
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
                      onChanged: (text){
                        // TODO: add your code to add the user email in firestore
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
                      onChanged: (text){
                        // TODO: add your code to add the user password in firestore
                      },
                    ),
                  ),
                ),
///////////////////////////////////////////////////////////////////////////////////
                SizedBox(height: 30.h, width: double.infinity.w),
                DefaultButton(
                    text: "Register",
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        emptyArea = false;

                        context.read<RegisterBloc>().add(RegisterUserEvent(email: _emailController.text, password: _userPasswordController.text));

                      }
                      if (emptyArea == false) {
                        await displaySnackBar("loading");
                        // TODO: add your code to register by email & password and store the user data in firestore
                      }
                    }),
///////////////////////////////////////////////////////////////////////////////////
                SizedBox(height: 20.h, width: double.infinity.w),
                Text(
                  "Already have an account ?",
                  style: (TextStyle(
                      color: textBlack, fontSize: commonTextSize.sp)),
                ),
///////////////////////////////////////////////////////////////////////////////////
                InkWell(
                  child: Text(
                    'Log in',
                    style: TextStyle(
                        color: textBlack,
                        fontSize: commonTextSize.sp,
                        fontWeight: commonTextWeight),
                  ),
                  onTap: () {
                    Navigator.pushNamed(context, Login.routeName);
                  },
                )
              ],
            ),
          )
        ],
      ),
    )));
  }
}

