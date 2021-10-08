part of 'map_cubit.dart';

@immutable
abstract class MapState {}

class MapInitial extends MapState {}

class MapLoading extends MapState {
  final double latitude;
  final double longitude;
  MapLoading({
    required this.latitude,
    required this.longitude,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MapLoading &&
        other.latitude == latitude &&
        other.longitude == longitude;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode;

  @override
  String toString() => 'MapLoading(latitude: $latitude, longitude: $longitude)';
}

class MapLoaded extends MapState {
  final double latitude;
  final double longitude;
  final String address;
  MapLoaded({
    required this.latitude,
    required this.longitude,
    required this.address,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MapLoaded &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.address == address;
  }

  @override
  int get hashCode => latitude.hashCode ^ longitude.hashCode ^ address.hashCode;

  @override
  String toString() =>
      'MapLoaded(latitude: $latitude, longitude: $longitude, address: $address)';
}

class MapFailed extends MapState {
  final double latitude;
  final double longitude;
  final String errorMsg;

  MapFailed({
    required this.latitude,
    required this.longitude,
    required this.errorMsg,
  });

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is MapFailed &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.errorMsg == errorMsg;
  }

  @override
  int get hashCode =>
      latitude.hashCode ^ longitude.hashCode ^ errorMsg.hashCode;

  @override
  String toString() =>
      'MapFailed(latitude: $latitude, longitude: $longitude, errorMsg: $errorMsg)';
}
