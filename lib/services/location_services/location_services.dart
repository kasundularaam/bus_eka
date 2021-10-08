import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class LocationServices {
  static Future<Position> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      return Future.error('Location services are disabled.');
    }

    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }
    return await Geolocator.getCurrentPosition();
  }

  static Future<String> getAddress({required LatLng latLng}) async {
    try {
      double modLat = double.parse(latLng.latitude.toStringAsFixed(4));
      double modLong = double.parse(latLng.longitude.toStringAsFixed(4));
      List<Placemark> placemarks =
          await placemarkFromCoordinates(modLat, modLong);
      String address = placemarks.first.street ?? "null";
      return address;
    } catch (e) {
      throw e.toString();
    }
  }
}
