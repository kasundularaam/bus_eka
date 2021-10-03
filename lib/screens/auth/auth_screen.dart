import 'package:bus_eka/constants/m_colors.dart';
import 'package:bus_eka/logic/auth_cubit/auth_cubit.dart';
import 'package:bus_eka/logic/login_cubit/login_cubit.dart';
import 'package:bus_eka/routers/app_router.dart';
import 'package:bus_eka/screens/auth/pages/landing_page.dart';
import 'package:bus_eka/screens/auth/pages/login_page.dart';
import 'package:bus_eka/screens/auth/pages/signup_page.dart';
import 'package:bus_eka/screens/screen_args/home_screen_arg.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthScreen extends StatelessWidget {
  const AuthScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<AuthCubit>(context).checkUser();
    return Scaffold(
      backgroundColor: MColors.lightClr,
      body: SafeArea(
        child: BlocConsumer<AuthCubit, AuthState>(
          listener: (context, state) {
            if (state is AuthSucceed) {
              Navigator.popAndPushNamed(context, AppRouter.homeScreen,
                  arguments: HomeScreenArg(user: state.userModel));
            } else if (state is AuthFailed) {
              SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is AuthLogin) {
              return BlocProvider(
                create: (context) => LoginCubit(),
                child: LoginPage(),
              );
            } else if (state is AuthSignup) {
              return BlocProvider(
                create: (context) => LoginCubit(),
                child: SignupPage(),
              );
            } else {
              return const LandingPage();
            }
          },
        ),
      ),
    );
  }
}
