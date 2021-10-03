import 'package:bus_eka/logic/auth_cubit/auth_cubit.dart';
import 'package:bus_eka/screens/auth/auth_screen.dart';
import 'package:bus_eka/screens/home/home_screen.dart';
import 'package:bus_eka/screens/screen_args/home_screen_arg.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const String homeScreen = "/homeScreen";
  static const String authScreen = "/";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: const AuthScreen(),
                ));
      case homeScreen:
        HomeScreenArg arg = settings.arguments as HomeScreenArg;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: HomeScreen(
              arg: arg,
            ),
          ),
        );
      default:
        throw "invalid route";
    }
  }
}
