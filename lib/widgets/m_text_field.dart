import 'package:bus_eka/constants/m_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MTextField extends StatelessWidget {
  final Function(String) onChanged;
  final Function(String) onSubmitted;
  final bool isPassword;
  final String hintText;
  const MTextField({
    Key? key,
    required this.onChanged,
    required this.onSubmitted,
    required this.isPassword,
    required this.hintText,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: MColors.contentsBgClr,
        borderRadius: BorderRadius.circular(2.w),
      ),
      child: TextField(
        obscureText: isPassword,
        onChanged: onChanged,
        onSubmitted: onSubmitted,
        autofocus: false,
        style: TextStyle(
          fontSize: 14.sp,
          color: MColors.darkClr,
        ),
        decoration: InputDecoration(
          hintText: hintText,
          hintStyle: TextStyle(
            fontSize: 14.sp,
            color: MColors.darkClr.withOpacity(0.7),
          ),
          contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          border: InputBorder.none,
        ),
        textInputAction: TextInputAction.done,
      ),
    );
  }
}
