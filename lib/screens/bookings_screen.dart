import 'package:bus_eka/constants/m_colors.dart';
import 'package:bus_eka/logic/bookings_cubit/bookings_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

class BookingsScreen extends StatelessWidget {
  const BookingsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<BookingsCubit>(context).loadMap();
    return Scaffold(
      body: SafeArea(
          child: Stack(children: [
        BlocConsumer<BookingsCubit, BookingsState>(
          listener: (context, state) {
            if (state is BookingsFailed) {
              SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is BookingsLoading) {
              return GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: state.initPos, zoom: 16));
            } else if (state is BookingsLoaded) {
              return GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: state.cameraPos, zoom: 16),
                markers: state.markers,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        Container(
          padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
          margin: EdgeInsets.symmetric(vertical: 2.h, horizontal: 5.w),
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
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
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
                    "Bookings",
                    style: TextStyle(
                        color: MColors.mainClr,
                        fontSize: 16.sp,
                        fontWeight: FontWeight.w600),
                  ),
                ],
              ),
              const Icon(
                Icons.qr_code_rounded,
                color: MColors.darkClr,
              ),
            ],
          ),
        )
      ])),
    );
  }
}
