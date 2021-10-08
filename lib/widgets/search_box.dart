import 'package:bus_eka/constants/m_colors.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SearchBox extends StatelessWidget {
  const SearchBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 5.w),
      padding: EdgeInsets.all(5.w),
      decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
                color: MColors.darkClr.withOpacity(0.2),
                offset: const Offset(1, 1),
                blurRadius: 2,
                spreadRadius: 2)
          ],
          color: MColors.contentsBgClr,
          borderRadius: BorderRadius.circular(3.w)),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              Image.asset("assets/images/from.png", width: 7.w, height: 7.w),
              SizedBox(
                width: 3.w,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.all(3.w),
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(2.w),
                      border: Border.all(color: MColors.darkClr, width: 0.2.w)),
                  child: Text(
                    "Your Location",
                    style: TextStyle(
                      color: MColors.darkClr.withOpacity(0.7),
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              )
            ],
          ),
          SizedBox(
            height: 2.h,
          ),
          Row(
            children: [
              Image.asset("assets/images/to.png", width: 7.w, height: 7.w),
              SizedBox(
                width: 3.w,
              ),
              Expanded(
                child: Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 3.w,
                  ),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(2.w),
                    border: Border.all(color: MColors.darkClr, width: 0.2.w),
                  ),
                  child: TextField(
                    onChanged: (text) {},
                    onSubmitted: (text) {},
                    autofocus: false,
                    style: TextStyle(
                      fontSize: 14.sp,
                      color: MColors.darkClr,
                    ),
                    decoration: InputDecoration(
                      hintText: "Destination...",
                      hintStyle: TextStyle(
                        fontSize: 14.sp,
                        color: MColors.darkClr.withOpacity(0.7),
                      ),
                      border: InputBorder.none,
                    ),
                    textInputAction: TextInputAction.search,
                  ),
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}
