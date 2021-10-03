import 'package:bus_eka/constants/m_colors.dart';
import 'package:bus_eka/widgets/booking_btn.dart';
import 'package:bus_eka/widgets/bus_type_btns.dart';
import 'package:bus_eka/widgets/map_view.dart';
import 'package:bus_eka/widgets/home_action_bar.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import 'package:bus_eka/screens/screen_args/home_screen_arg.dart';

class HomeScreen extends StatelessWidget {
  final HomeScreenArg arg;
  const HomeScreen({
    Key? key,
    required this.arg,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.lightClr,
      body: SafeArea(
          child: Stack(
        children: [
          const MapView(),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: const BusTypeBtns(),
            ),
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.all(2.w),
              child: const BookingBtn(),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(5.w),
            child: const HomeActionBar(),
          ),
        ],
      )),
    );
  }
}
