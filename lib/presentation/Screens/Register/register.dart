import 'package:flutter/material.dart';
import '../../../core/utils/constants.dart';
import 'Components/registerBody.dart';

class Register extends StatelessWidget {
  static String routeName = "/Register";
  const Register({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: textWhite),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: RegisterBody(),
      ),
    );
  }
}
