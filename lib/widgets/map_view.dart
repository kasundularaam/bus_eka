import 'dart:collection';

import 'package:bus_eka/constants/m_colors.dart';
import 'package:bus_eka/logic/map_cubit/map_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Set<Marker> markers = HashSet<Marker>();

  @override
  Widget build(BuildContext context) {
    BlocProvider.of<MapCubit>(context).initMap();
    return BlocConsumer<MapCubit, MapState>(
      listener: (context, state) {
        if (state is MapFailed) {
          SnackBar snackBar = SnackBar(content: Text(state.errorMsg));
          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        }
      },
      builder: (context, state) {
        if (state is MapLoading) {
          return Stack(
            children: [
              GoogleMap(
                  initialCameraPosition: CameraPosition(
                      target: LatLng(state.latitude, state.longitude),
                      zoom: 16)),
              Container(
                color: MColors.darkClr.withOpacity(0.3),
                child: const Center(
                  child: CircularProgressIndicator(),
                ),
              ),
            ],
          );
        } else if (state is MapLoaded) {
          markers.clear();
          markers.add(Marker(
              markerId: const MarkerId("1"),
              position: LatLng(state.latitude, state.longitude),
              infoWindow: InfoWindow(title: state.address)));
          return GoogleMap(
            onTap: (latLng) =>
                BlocProvider.of<MapCubit>(context).loadMap(latLng: latLng),
            initialCameraPosition: CameraPosition(
                target: LatLng(state.latitude, state.longitude), zoom: 16),
            markers: markers,
          );
        } else {
          return const SizedBox();
        }
      },
    );
  }
}
