import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:bus_eka/constants/m_colors.dart';
import 'package:bus_eka/data/models/bus_eka_model.dart';

class BusEkaCrd extends StatelessWidget {
  final BusEkaModel busEkaModel;
  const BusEkaCrd({
    Key? key,
    required this.busEkaModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: EdgeInsets.all(5.w),
          decoration: BoxDecoration(
            color: MColors.contentsBgClr,
            borderRadius: BorderRadius.circular(2.5.w),
            boxShadow: [
              BoxShadow(
                  color: MColors.darkClr.withOpacity(0.2),
                  offset: const Offset(1, 1),
                  blurRadius: 2,
                  spreadRadius: 2)
            ],
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  ClipOval(
                    child: Image.asset(
                      "assets/images/bus_eka.png",
                      width: 10.w,
                      height: 10.w,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    busEkaModel.busNumber,
                    style: TextStyle(
                        color: MColors.darkClr,
                        fontSize: 14.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                busEkaModel.route,
                style: TextStyle(
                  color: MColors.darkClr,
                  fontSize: 14.sp,
                ),
              ),
              SizedBox(
                height: 2.h,
              ),
              Row(
                children: [
                  Text(
                    "start: ${busEkaModel.startTime}",
                    style: TextStyle(
                      color: MColors.darkClr,
                      fontSize: 14.sp,
                    ),
                  ),
                  SizedBox(
                    width: 10.w,
                  ),
                  Text(
                    "end: ${busEkaModel.endTime}",
                    style: TextStyle(
                      color: MColors.darkClr,
                      fontSize: 14.sp,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 2.h,
              ),
              Text(
                "${busEkaModel.waitingTime} to your place",
                style: TextStyle(
                  color: MColors.darkClr,
                  fontSize: 14.sp,
                ),
              ),
            ],
          ),
        ),
        SizedBox(
          height: 2.h,
        ),
      ],
    );
  }
}
