import 'dart:collection';

import 'package:bloc/bloc.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'driver_home_state.dart';

class DriverHomeCubit extends Cubit<DriverHomeState> {
  DriverHomeCubit() : super(DriverHomeInitial());

  double latitude = 6.971301;
  double longitude = 79.885216;

  Future<BitmapDescriptor> getMarkerIcon() async {
    BitmapDescriptor markerIcon = await BitmapDescriptor.fromAssetImage(
        const ImageConfiguration(devicePixelRatio: 3.2),
        "assets/images/bus_marker.png");
    return markerIcon;
  }

  Set<Marker> markers = HashSet<Marker>();

  Future<void> loadMap() async {
    try {
      emit(DriverHomeLoading(initPos: LatLng(latitude, longitude)));
      // Position currentPosition = await LocationServices.getCurrentLocation();
      // latitude = currentPosition.latitude;
      // longitude = currentPosition.longitude;
      BitmapDescriptor markerIcon = await getMarkerIcon();
      List<Marker> markerList = [
        Marker(
          markerId: MarkerId("1"),
          position: LatLng(6.971301, 79.885216),
          icon: markerIcon,
        ),
        Marker(
          markerId: MarkerId("2"),
          position: LatLng(6.974063, 79.887301),
          icon: markerIcon,
        ),
        Marker(
          markerId: MarkerId("3"),
          position: LatLng(6.968962, 79.889274),
          icon: markerIcon,
        ),
        Marker(
          markerId: MarkerId("4"),
          position: LatLng(6.968674, 79.891774),
          icon: markerIcon,
        )
      ];
      for (var marker in markerList) {
        markers.add(marker);
      }
      emit(DriverHomeLoaded(
          markers: markers, cameraPos: LatLng(latitude, longitude)));
    } catch (e) {
      emit(DriverHomeFailed(
          latLng: LatLng(latitude, longitude), errorMsg: e.toString()));
    }
  }
}
