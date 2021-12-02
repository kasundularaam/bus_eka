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
                showModalBottomSheet(
                    context: context,
                    builder: (bottomSheetContext) {
                      return Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          mainAxisSize: MainAxisSize.min,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              height: 3.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.person_rounded,
                                  size: 22.sp,
                                  color: MColors.mainClr,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  userModel.userName,
                                  textAlign: TextAlign.center,
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
                            Container(
                              width: 100.w,
                              height: 0.03.h,
                              color: MColors.darkClr,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              children: [
                                Icon(
                                  Icons.mail_rounded,
                                  size: 22.sp,
                                  color: MColors.mainClr,
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Text(
                                  userModel.userEmail,
                                  textAlign: TextAlign.center,
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
                            Container(
                              width: 100.w,
                              height: 0.03.h,
                              color: MColors.darkClr,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(bottomSheetContext);
                                AuthCredentials.removeUser();
                                Navigator.pushNamedAndRemoveUntil(context,
                                    AppRouter.authScreen, (route) => false);
                              },
                              child: Row(
                                children: [
                                  Icon(
                                    Icons.logout_rounded,
                                    size: 22.sp,
                                    color: Colors.red,
                                  ),
                                  SizedBox(
                                    width: 4.w,
                                  ),
                                  Text(
                                    "Log Out",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.red,
                                        fontSize: 14.sp,
                                        fontWeight: FontWeight.w500),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        ),
                      );
                    });
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
