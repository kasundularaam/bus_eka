import 'package:bus_eka/constants/m_colors.dart';
import 'package:bus_eka/routers/app_router.dart';
import 'package:bus_eka/services/local_services/auth_credentials.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomeActionBar extends StatelessWidget {
  const HomeActionBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 1.w),
      decoration: BoxDecoration(
          color: MColors.contentsBgClr,
          borderRadius: BorderRadius.circular(2.5.w),
          boxShadow: [
            BoxShadow(
                color: MColors.darkClr.withOpacity(0.2),
                offset: const Offset(1, 1),
                blurRadius: 2,
                spreadRadius: 2)
          ]),
      child: Row(
        children: [
          Expanded(
            child: TextField(
              onChanged: (text) {},
              onSubmitted: (text) {},
              autofocus: false,
              style: TextStyle(
                fontSize: 14.sp,
                color: MColors.darkClr,
              ),
              decoration: InputDecoration(
                hintText: "Search...",
                hintStyle: TextStyle(
                  fontSize: 14.sp,
                  color: MColors.darkClr.withOpacity(0.7),
                ),
                contentPadding: EdgeInsets.symmetric(horizontal: 5.w),
                border: InputBorder.none,
              ),
              textInputAction: TextInputAction.search,
            ),
          ),
          Container(
            color: MColors.darkClr.withOpacity(0.7),
            width: 0.3.w,
            height: 3.h,
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w),
            child: GestureDetector(
              onTap: () {
                AuthCredentials.removeUser();
                Navigator.popAndPushNamed(context, AppRouter.authScreen);
              },
              child: ClipOval(
                child: Container(
                  padding: EdgeInsets.all(1.w),
                  color: MColors.mainClr,
                  child: const Icon(
                    Icons.person_rounded,
                    color: MColors.contentsBgClr,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
