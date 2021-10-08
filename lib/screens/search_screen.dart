import 'package:bus_eka/constants/m_colors.dart';
import 'package:bus_eka/logic/map_cubit/map_cubit.dart';
import 'package:bus_eka/widgets/map_view.dart';
import 'package:bus_eka/widgets/search_box.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sizer/sizer.dart';

class SearchScreen extends StatelessWidget {
  const SearchScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: MColors.lightClr,
      body: SafeArea(
        child: Stack(
          children: [
            BlocProvider(
              create: (context) => MapCubit(),
              child: const MapView(),
            ),
            Padding(
              padding: EdgeInsets.only(top: 2.h),
              child: const SearchBox(),
            ),
          ],
        ),
      ),
    );
  }
}
