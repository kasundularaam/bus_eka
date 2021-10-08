import 'package:bus_eka/logic/bookings_cubit/bookings_cubit.dart';
import 'package:bus_eka/logic/driver_home_cubit/driver_home_cubit.dart';
import 'package:bus_eka/routers/app_router.dart';
import 'package:bus_eka/widgets/bookings_btn.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:sizer/sizer.dart';

import 'package:bus_eka/data/models/user_model.dart';
import 'package:bus_eka/widgets/action_bar.dart';

class DriverHome extends StatelessWidget {
  final UserModel userModel;
  const DriverHome({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<DriverHomeCubit>(context).loadMap();
    return Stack(
      children: [
        BlocConsumer<DriverHomeCubit, DriverHomeState>(
          listener: (context, state) {
            if (state is DriverHomeFailed) {
              SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            }
          },
          builder: (context, state) {
            if (state is DriverHomeLoading) {
              return GoogleMap(
                  initialCameraPosition:
                      CameraPosition(target: state.initPos, zoom: 15));
            } else if (state is DriverHomeLoaded) {
              return GoogleMap(
                initialCameraPosition:
                    CameraPosition(target: state.cameraPos, zoom: 15),
                markers: state.markers,
              );
            } else {
              return const SizedBox();
            }
          },
        ),
        Align(
          alignment: Alignment.bottomRight,
          child: Padding(
            padding: EdgeInsets.all(2.w),
            child: BookingsBtn(
              onTap: () => Navigator.pushNamed(
                context,
                AppRouter.bookingsScreen,
              ),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5.w),
          child: ActionBar(userModel: userModel),
        ),
      ],
    );
  }
}
