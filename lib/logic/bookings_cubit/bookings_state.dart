part of 'bookings_cubit.dart';

@immutable
abstract class BookingsState {}

class BookingsInitial extends BookingsState {}

class BookingsLoading extends BookingsState {
  final LatLng initPos;
  BookingsLoading({
    required this.initPos,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookingsLoading && other.initPos == initPos;
  }

  @override
  int get hashCode => initPos.hashCode;

  @override
  String toString() => 'BookingsLoading(initPos: $initPos)';
}

class BookingsLoaded extends BookingsState {
  final Set<Marker> markers;
  final LatLng cameraPos;
  BookingsLoaded({
    required this.markers,
    required this.cameraPos,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookingsLoaded &&
        setEquals(other.markers, markers) &&
        other.cameraPos == cameraPos;
  }

  @override
  int get hashCode => markers.hashCode ^ cameraPos.hashCode;

  @override
  String toString() =>
      'BookingsLoaded(markers: $markers, cameraPos: $cameraPos)';
}

class BookingsFailed extends BookingsState {
  final String errorMsg;
  final LatLng latLng;
  BookingsFailed({
    required this.errorMsg,
    required this.latLng,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BookingsFailed &&
        other.errorMsg == errorMsg &&
        other.latLng == latLng;
  }

  @override
  int get hashCode => errorMsg.hashCode ^ latLng.hashCode;

  @override
  String toString() => 'BookingsFailed(errorMsg: $errorMsg, latLng: $latLng)';
}
