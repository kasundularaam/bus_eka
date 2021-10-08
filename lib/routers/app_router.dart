import 'package:bus_eka/logic/auth_cubit/auth_cubit.dart';
import 'package:bus_eka/logic/bookings_cubit/bookings_cubit.dart';
import 'package:bus_eka/screens/auth/auth_screen.dart';
import 'package:bus_eka/screens/booking_screen.dart';
import 'package:bus_eka/screens/bookings_screen.dart';
import 'package:bus_eka/screens/home/home_screen.dart';
import 'package:bus_eka/screens/screen_args/home_screen_arg.dart';
import 'package:bus_eka/screens/search_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppRouter {
  static const String homeScreen = "/homeScreen";
  static const String authScreen = "/";
  static const String searchScreen = "/searchScreen";
  static const String bookingsScreen = "/bookingsScreen";
  static const String bookingScreen = "/bookingScreen";

  static Route<dynamic> onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case authScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => AuthCubit(),
                  child: const AuthScreen(),
                ));
      case homeScreen:
        HomeScreenArg arg = settings.arguments as HomeScreenArg;
        return MaterialPageRoute(
          builder: (_) => BlocProvider(
            create: (context) => AuthCubit(),
            child: HomeScreen(
              arg: arg,
            ),
          ),
        );
      case searchScreen:
        return MaterialPageRoute(builder: (_) => const SearchScreen());
      case bookingsScreen:
        return MaterialPageRoute(
            builder: (_) => BlocProvider(
                  create: (context) => BookingsCubit(),
                  child: const BookingsScreen(),
                ));
      case bookingScreen:
        return MaterialPageRoute(builder: (_) => const BookingScreen());
      default:
        throw "invalid route";
    }
  }
}
