import 'package:bus_eka/constants/m_colors.dart';
import 'package:bus_eka/data/models/bus_eka_model.dart';
import 'package:bus_eka/widgets/bus_eka_crd.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class BookingScreen extends StatelessWidget {
  const BookingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<BusEkaModel> busList = [
      BusEkaModel(
          busNumber: "BN-5427",
          startTime: "10:30",
          endTime: "11:00",
          waitingTime: "27min",
          route: "Kollupitiya - Fort (126)"),
      BusEkaModel(
          busNumber: "CJ-3489",
          startTime: "12:30",
          endTime: "14:00",
          waitingTime: "1hr",
          route: "Wallawatta - Ragama (234)"),
    ];
    return Scaffold(
      backgroundColor: MColors.lightClr,
      body: SafeArea(
        child: Column(
          children: [
            Container(
              color: MColors.contentsBgClr,
              padding: EdgeInsets.all(5.w),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () => Navigator.pop(context),
                    child: const Icon(
                      Icons.arrow_back_rounded,
                      color: MColors.mainClr,
                    ),
                  ),
                  SizedBox(
                    width: 2.w,
                  ),
                  Text(
                    "Available Buses",
                    style: TextStyle(
                        color: MColors.mainClr,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
            ),
            Container(
              color: MColors.contentsBgClr,
              padding: EdgeInsets.all(5.w),
              child: Center(
                child: Text(
                  "Bambalapitiya - Kollupitiya",
                  style: TextStyle(
                    color: MColors.darkClr,
                    fontSize: 16.sp,
                  ),
                ),
              ),
            ),
            Container(
              color: MColors.darkClr,
              width: 100.w,
              height: 0.2,
            ),
            Expanded(
              child: ListView(
                physics: const BouncingScrollPhysics(),
                padding: EdgeInsets.symmetric(horizontal: 3.w),
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: busList.length,
                    itemBuilder: (context, index) {
                      BusEkaModel busEkaModel = busList[index];
                      return BusEkaCrd(busEkaModel: busEkaModel);
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
