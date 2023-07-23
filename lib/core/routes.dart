import 'package:flutter/widgets.dart';
import 'package:abs_ai_auth_task/presentation/Screens/HomePage.dart';
import 'package:abs_ai_auth_task/presentation/Screens/Login/login.dart';
import 'package:abs_ai_auth_task/presentation/Screens/LoginOrSignup/loginOrSignup.dart';
import 'package:abs_ai_auth_task/presentation/Screens/Register/register.dart';

final Map<String, WidgetBuilder> routes = {
  LogInOrSignup.routeName: (context) => const LogInOrSignup(),
  Login.routeName: (context) => const Login(),
  Register.routeName: (context) => const Register(),
  HomePage.routeName: (context) => const HomePage(),

};
