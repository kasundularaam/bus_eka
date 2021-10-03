// ignore_for_file: must_be_immutable

import 'package:bus_eka/constants/m_colors.dart';
import 'package:bus_eka/logic/auth_cubit/auth_cubit.dart';
import 'package:bus_eka/logic/login_cubit/login_cubit.dart';
import 'package:bus_eka/widgets/m_button.dart';
import 'package:bus_eka/widgets/m_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SignupPage extends StatelessWidget {
  SignupPage({Key? key}) : super(key: key);

  String name = "";
  String email = "";
  String password = "";

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: EdgeInsets.symmetric(horizontal: 5.w),
      physics: const BouncingScrollPhysics(),
      children: [
        SizedBox(
          height: 3.h,
        ),
        Image.asset("assets/images/bus_stop.png"),
        SizedBox(
          height: 3.h,
        ),
        MTextField(
            onChanged: (nameTxt) => name = nameTxt,
            onSubmitted: (nameTxt) => name = nameTxt,
            isPassword: false,
            hintText: "name.."),
        SizedBox(
          height: 3.h,
        ),
        MTextField(
            onChanged: (emailTxt) => email = emailTxt,
            onSubmitted: (emailTxt) => email = emailTxt,
            isPassword: false,
            hintText: "email.."),
        SizedBox(
          height: 3.h,
        ),
        MTextField(
            onChanged: (passwordTxt) => password = passwordTxt,
            onSubmitted: (passwordTxt) => password = passwordTxt,
            isPassword: true,
            hintText: "password.."),
        SizedBox(
          height: 3.h,
        ),
        BlocConsumer<LoginCubit, LoginState>(
          listener: (context, state) {
            if (state is LoginSucceed) {
              BlocProvider.of<AuthCubit>(context).checkUser();
            } else if (state is LoginFailed) {
              SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is LoginLoading) {
              return const Center(child: CircularProgressIndicator());
            } else {
              return Center(
                child: LoginButton(
                  text: "Sign Up",
                  onPressed: () {
                    BlocProvider.of<LoginCubit>(context).signUpUser(
                        email: email, password: password, name: name);
                  },
                ),
              );
            }
          },
        ),
        SizedBox(
          height: 5.h,
        ),
        Center(
          child: GestureDetector(
            onTap: () => BlocProvider.of<AuthCubit>(context).emit(AuthLogin()),
            child: Text(
              "Log In",
              style: TextStyle(
                color: MColors.darkClr,
                fontSize: 14.sp,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
        SizedBox(
          height: 3.h,
        ),
      ],
    );
  }
}
