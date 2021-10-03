import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:bus_eka/constants/m_colors.dart';

class LoginButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  const LoginButton({
    Key? key,
    required this.text,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onPressed(),
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 7.w, vertical: 1.4.h),
        decoration: BoxDecoration(
          color: MColors.mainClr,
          borderRadius: BorderRadius.circular(3.w),
        ),
        child: Text(
          text,
          style: TextStyle(
            color: MColors.lightClr,
            fontSize: 16.sp,
            fontWeight: FontWeight.w500,
          ),
        ),
      ),
    );
  }
}
