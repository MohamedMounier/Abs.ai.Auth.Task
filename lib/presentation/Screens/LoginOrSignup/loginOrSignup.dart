import '../../../core/utils/constants.dart';
import 'components/loginOrSignupBody.dart';
import 'package:flutter/material.dart';

class LogInOrSignup extends StatelessWidget {
  const LogInOrSignup({Key? key}) : super(key: key);
  static String routeName = "/logInOrSignup";

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: textWhite),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: LogInOrSignupBody(),
      ),
    );
  }
}
