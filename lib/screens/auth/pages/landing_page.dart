import 'package:bus_eka/constants/m_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class LandingPage extends StatelessWidget {
  const LandingPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: Column(
      children: [
        Image.asset("assets/images/bus_stop.png"),
        Text(
          "Loading...",
          style: TextStyle(
            color: MColors.mainClr,
            fontSize: 12.sp,
          ),
        )
      ],
    ));
  }
}
