import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';
import 'Components/loginBody.dart';

class Login extends StatelessWidget {
  static String routeName = "/Login";
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: textWhite),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: LoginBody(),
      ),
    );
  }
}
