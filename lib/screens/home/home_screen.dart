import 'package:bus_eka/constants/m_colors.dart';
import 'package:bus_eka/logic/driver_home_cubit/driver_home_cubit.dart';
import 'package:bus_eka/screens/views/driver_home.dart';
import 'package:bus_eka/screens/views/user_home.dart';
import 'package:flutter/material.dart';

import 'package:bus_eka/screens/screen_args/home_screen_arg.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenArg arg;
  const HomeScreen({
    Key? key,
    required this.arg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.lightClr,
      body: SafeArea(
          child: arg.user.isDriver
              ? BlocProvider(
                  create: (context) => DriverHomeCubit(),
                  child: DriverHome(userModel: arg.user),
                )
              : UserHome(
                  userModel: arg.user,
                )),
    );
  }
}
