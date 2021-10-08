import 'package:bus_eka/routers/app_router.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

import 'package:bus_eka/data/models/user_model.dart';
import 'package:bus_eka/logic/map_cubit/map_cubit.dart';
import 'package:bus_eka/widgets/action_bar.dart';
import 'package:bus_eka/widgets/booking_btn.dart';
import 'package:bus_eka/widgets/bus_type_btns.dart';
import 'package:bus_eka/widgets/map_view.dart';

class UserHome extends StatelessWidget {
  final UserModel userModel;
  const UserHome({
    Key? key,
    required this.userModel,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        BlocProvider(
          create: (context) => MapCubit(),
          child: const MapView(),
        ),
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
            child: BookingBtn(
              onTap: () =>
                  Navigator.pushNamed(context, AppRouter.bookingScreen),
            ),
          ),
        ),
        Padding(
          padding: EdgeInsets.all(5.w),
          child: ActionBar(
            userModel: userModel,
          ),
        ),
      ],
    );
  }
}
