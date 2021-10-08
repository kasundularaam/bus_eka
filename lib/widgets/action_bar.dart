import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:bus_eka/constants/m_colors.dart';
import 'package:bus_eka/data/models/user_model.dart';
import 'package:bus_eka/routers/app_router.dart';
import 'package:bus_eka/services/local_services/auth_credentials.dart';

class ActionBar extends StatelessWidget {
  final UserModel userModel;
  const ActionBar({
    Key? key,
    required this.userModel,
  }) : super(key: key);

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
            child: userModel.isDriver
                ? Container(
                    padding: EdgeInsets.all(3.5.w),
                    child: Text(
                      "Bus Eka",
                      style: TextStyle(
                          color: MColors.mainClr,
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600),
                    ),
                  )
                : GestureDetector(
                    onTap: () =>
                        Navigator.pushNamed(context, AppRouter.searchScreen),
                    child: Container(
                      padding: EdgeInsets.all(3.5.w),
                      child: Text(
                        "Search...",
                        style: TextStyle(
                          color: MColors.darkClr.withOpacity(0.7),
                          fontSize: 14.sp,
                        ),
                      ),
                    ),
                  ),
          ),
          Container(
            color: MColors.darkClr.withOpacity(0.7),
            width: 0.3.w,
            height: 3.5.h,
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
                  child: Icon(
                    Icons.person_rounded,
                    color: MColors.contentsBgClr,
                    size: 20.sp,
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
