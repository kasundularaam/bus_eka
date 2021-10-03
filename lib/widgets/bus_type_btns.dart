import 'package:bus_eka/constants/m_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BusTypeBtns extends StatelessWidget {
  const BusTypeBtns({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          padding: EdgeInsets.all(2.w),
          height: 18.w,
          width: 18.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.w),
              color: MColors.contentsBgClr,
              border: Border.all(color: MColors.mainClr, width: 1.w),
              boxShadow: [
                BoxShadow(
                    color: MColors.darkClr.withOpacity(0.2),
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    spreadRadius: 2)
              ]),
          child: Image.asset(
            "assets/images/bus_eka.png",
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          padding: EdgeInsets.all(3.w),
          height: 18.w,
          width: 18.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.w),
              color: MColors.contentsBgClr,
              boxShadow: [
                BoxShadow(
                    color: MColors.darkClr.withOpacity(0.2),
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    spreadRadius: 2)
              ]),
          child: Image.asset(
            "assets/images/luxery.png",
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          padding: EdgeInsets.all(2.w),
          height: 18.w,
          width: 18.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.w),
              color: MColors.contentsBgClr,
              boxShadow: [
                BoxShadow(
                    color: MColors.darkClr.withOpacity(0.2),
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    spreadRadius: 2)
              ]),
          child: Image.asset(
            "assets/images/semi.png",
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
        Container(
          padding: EdgeInsets.all(2.w),
          height: 18.w,
          width: 18.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.w),
              color: MColors.contentsBgClr,
              boxShadow: [
                BoxShadow(
                    color: MColors.darkClr.withOpacity(0.2),
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    spreadRadius: 2)
              ]),
          child: Icon(
            Icons.ac_unit_rounded,
            color: Colors.blue,
            size: 30.sp,
          ),
        ),
      ],
    );
  }
}
