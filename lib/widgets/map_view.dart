import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:geocoding/geocoding.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapView extends StatefulWidget {
  const MapView({Key? key}) : super(key: key);

  @override
  State<MapView> createState() => _MapViewState();
}

class _MapViewState extends State<MapView> {
  Set<Marker> markers = HashSet<Marker>();

  int markerIdCounter = 1;

  String address = "";

  double colomboLat = 6.9271;

  double colomboLong = 79.8612;

  Future<String> getAddress(LatLng point) async {
    double modLat = double.parse(point.latitude.toStringAsFixed(4));
    double modLong = double.parse(point.longitude.toStringAsFixed(4));
    List<Placemark> placemarks =
        await placemarkFromCoordinates(modLat, modLong);
    String address = placemarks.first.street ?? "";
    return address;
  }

  void setMarkers(LatLng point) async {
    final String markerIdVal = 'marker_id_$markerIdCounter';
    markerIdCounter++;
    markers.add(
      Marker(
        markerId: MarkerId(markerIdVal),
        position: point,
        infoWindow: InfoWindow(
          title: address,
        ),
      ),
    );
  }

  void getData(LatLng point) async {
    await getAddress(point).then((value) {
      setState(() {
        address = value;
      });
    });
    markers.clear();
    setMarkers(point);
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GoogleMap(
          initialCameraPosition:
              CameraPosition(target: LatLng(colomboLat, colomboLong), zoom: 16),
          onMapCreated: (GoogleMapController controller) {},
          mapType: MapType.normal,
          myLocationEnabled: true,
          myLocationButtonEnabled: true,
          markers: markers,
          onTap: (point) {
            getData(point);
          },
        ),
      ],
    );
  }
}
