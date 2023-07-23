import 'package:abs_ai_auth_task/data/datasource/auth_data_source.dart';
import 'package:abs_ai_auth_task/data/repository/auth_repo.dart';
import 'package:abs_ai_auth_task/domain/repository/base_auth_repo.dart';
import 'package:abs_ai_auth_task/domain/usecases/auth_use_cases/login_fire_use_case.dart';
import 'package:abs_ai_auth_task/presentation/Screens/LoginOrSignup/loginOrSignup.dart';
import 'package:abs_ai_auth_task/presentation/controllers/auth/login_bloc.dart';
import 'package:abs_ai_auth_task/presentation/controllers/auth/register_bloc.dart';
import 'package:abs_ai_auth_task/presentation/controllers/home/home_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'core/routes.dart';


void main()async {
  //TODO: initialize Firebase here
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: const Size(360, 640),
      minTextAdapt: true,
      splitScreenMode: true,

      builder: (context, child) {
        return MultiBlocProvider(providers: [
          BlocProvider<LoginBloc>(create: (_)=>LoginBloc()),
          BlocProvider<RegisterBloc>(create: (_)=>RegisterBloc()),
          BlocProvider<HomeBloc>(create: (_)=>HomeBloc()),
        ], child: MaterialApp(

          debugShowCheckedModeBanner: false,
          initialRoute: LogInOrSignup.routeName,
          routes: routes,
          theme: ThemeData(fontFamily: 'Changa'),
        ));
      },
    );
  }
}