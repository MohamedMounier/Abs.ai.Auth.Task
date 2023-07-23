import 'package:abs_ai_auth_task/core/enums/enums.dart';
import 'package:abs_ai_auth_task/core/utils/constants.dart';
import 'package:abs_ai_auth_task/presentation/controllers/home/home_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePage extends StatelessWidget {
  static String routeName = "/HomePage";

  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(color: textWhite),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: BlocBuilder<HomeBloc, HomeState>(
          builder: (context, state) {
            if (state.homeSteps==HomeSteps.isGettingCurrentUserLoading) {
           return   Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: Visibility(
                  visible: state.homeSteps ==
                      HomeSteps.isGettingCurrentUserSuccess,
                  child: Column(
                    children: [
                      Text(
                        "successful authenticated",
                        textAlign: TextAlign.center,

                        style: TextStyle(fontSize: mainButtonsSize),
                      ),
                      Text(
                        "Welcome ... ${state.currentUser!.userName}",
                        textAlign: TextAlign.center,

                        style: TextStyle(fontSize: mainButtonsSize),
                      ),
                    ],
                  ),
                  replacement: Center(child: CircularProgressIndicator(),),
                ),
              );
            }
          },
        ),
      ),
    );
  }
}
