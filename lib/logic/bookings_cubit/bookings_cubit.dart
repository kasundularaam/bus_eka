import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'bookings_state.dart';

class BookingsCubit extends Cubit<BookingsState> {
  BookingsCubit() : super(BookingsInitial());

  double latitude = 6.897473;
  double longitude = 79.892237;

  Future<BitmapDescriptor> getMarkerIcon() async {
    BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 3.2),
        "assets/images/passenger.png");
    return markerIcon;
  }

  Set<Marker> markers = HashSet<Marker>();

  Future<void> loadMap() async {
    try {
      emit(BookingsLoading(initPos: LatLng(latitude, longitude)));
      // Position currentPosition = await LocationServices.getCurrentLocation();
      // latitude = currentPosition.latitude;
      // longitude = currentPosition.longitude;
      BitmapDescriptor markerIcon = await getMarkerIcon();
      List<Marker> markerList = [
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(6.897473, 79.892237),
          icon: markerIcon,
        ),
        Marker(
          markerId: MarkerId("2"),
          position: LatLng(6.898144, 79.892913),
          icon: markerIcon,
        ),
        Marker(
          markerId: MarkerId("3"),
          position: LatLng(6.900370, 79.894050),
          icon: markerIcon,
        ),
        Marker(
          markerId: MarkerId("4"),
          position: LatLng(6.901712, 79.894061),
          icon: markerIcon,
        )
      ];
      for (var marker in markerList) {
        markers.add(marker);
      }
      emit(BookingsLoaded(
          markers: markers, cameraPos: LatLng(latitude, longitude)));
    } catch (e) {
      emit(BookingsFailed(
          latLng: LatLng(latitude, longitude), errorMsg: e.toString()));
    }
  }
}
