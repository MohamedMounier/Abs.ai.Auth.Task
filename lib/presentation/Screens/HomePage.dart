import 'package:abs_ai_auth_task/core/utils/constants.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/HomePage";
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: textWhite),
      child: const Scaffold(
        backgroundColor: Colors.transparent,
        body: Center(
          child: Column(
            children: [
              Text(
                "successful authenticated",
                textAlign: TextAlign.center,

                style: TextStyle(fontSize: mainButtonsSize),
              ),
              Text(
                "Welcome ...",
                textAlign: TextAlign.center,

                style: TextStyle(fontSize: mainButtonsSize),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
