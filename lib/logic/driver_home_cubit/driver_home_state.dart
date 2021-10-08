part of 'driver_home_cubit.dart';

@immutable
abstract class DriverHomeState {}

class DriverHomeInitial extends DriverHomeState {}

class DriverHomeLoading extends DriverHomeState {
  final LatLng initPos;
  DriverHomeLoading({
    required this.initPos,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DriverHomeLoading && other.initPos == initPos;
  }

  @override
  int get hashCode => initPos.hashCode;

  @override
  String toString() => 'DriverHomeLoading(initPos: $initPos)';
}

class DriverHomeLoaded extends DriverHomeState {
  final Set<Marker> markers;
  final LatLng cameraPos;
  DriverHomeLoaded({
    required this.markers,
    required this.cameraPos,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DriverHomeLoaded &&
        setEquals(other.markers, markers) &&
        other.cameraPos == cameraPos;
  }

  @override
  int get hashCode => markers.hashCode ^ cameraPos.hashCode;

  @override
  String toString() =>
      'DriverHomeLoaded(markers: $markers, cameraPos: $cameraPos)';
}

class DriverHomeFailed extends DriverHomeState {
  final String errorMsg;
  final LatLng latLng;
  DriverHomeFailed({
    required this.errorMsg,
    required this.latLng,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is DriverHomeFailed &&
        other.errorMsg == errorMsg &&
        other.latLng == latLng;
  }

  @override
  int get hashCode => errorMsg.hashCode ^ latLng.hashCode;

  @override
  String toString() => 'DriverHomeFailed(errorMsg: $errorMsg, latLng: $latLng)';
}
