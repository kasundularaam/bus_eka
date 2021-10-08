import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:bus_eka/constants/m_colors.dart';

class BookingBtn extends StatelessWidget {
  final Function onTap;
  const BookingBtn({
    Key? key,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => onTap(),
      child: Container(
          padding: EdgeInsets.all(3.w),
          height: 18.w,
          width: 18.w,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(9.w),
              color: MColors.contentsBgClr,
              border: Border.all(color: Colors.green, width: 1.w),
              boxShadow: [
                BoxShadow(
                    color: MColors.darkClr.withOpacity(0.2),
                    offset: const Offset(1, 1),
                    blurRadius: 2,
                    spreadRadius: 2)
              ]),
          child: Image.asset("assets/images/book.png")),
    );
  }
}
