import 'package:bloc/bloc.dart';
import 'package:bus_eka/services/location_services/location_services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:meta/meta.dart';

part 'map_state.dart';

class MapCubit extends Cubit<MapState> {
  MapCubit() : super(MapInitial());

  double latitude = 6.9271;
  double longitude = 79.8612;

  Future<void> initMap() async {
    try {
      emit(MapLoading(latitude: latitude, longitude: longitude));
      Position currentPosition = await LocationServices.getCurrentLocation();
      latitude = currentPosition.latitude;
      longitude = currentPosition.longitude;
      String address = await LocationServices.getAddress(
          latLng: LatLng(latitude, longitude));
      emit(MapLoaded(
          latitude: latitude, longitude: longitude, address: address));
    } catch (e) {
      emit(MapFailed(
          latitude: latitude, longitude: longitude, errorMsg: e.toString()));
    }
  }

  Future<void> loadMap({required LatLng latLng}) async {
    try {
      emit(MapLoading(latitude: latitude, longitude: longitude));
      latitude = latLng.latitude;
      longitude = latLng.longitude;
      String address = await LocationServices.getAddress(
          latLng: LatLng(latitude, longitude));
      emit(MapLoaded(
          latitude: latitude, longitude: longitude, address: address));
    } catch (e) {
      emit(MapFailed(
          latitude: latitude, longitude: longitude, errorMsg: e.toString()));
    }
  }
}
