import 'dart:convert';

class BusEkaModel {
  final String busNumber;
  final String startTime;
  final String endTime;
  final String waitingTime;
  final String route;
  BusEkaModel({
    required this.busNumber,
    required this.startTime,
    required this.endTime,
    required this.waitingTime,
    required this.route,
  });

  BusEkaModel copyWith({
    String? busNumber,
    String? startTime,
    String? endTime,
    String? waitingTime,
    String? route,
  }) {
    return BusEkaModel(
      busNumber: busNumber ?? this.busNumber,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
      waitingTime: waitingTime ?? this.waitingTime,
      route: route ?? this.route,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'busNumber': busNumber,
      'startTime': startTime,
      'endTime': endTime,
      'waitingTime': waitingTime,
      'route': route,
    };
  }

  factory BusEkaModel.fromMap(Map<String, dynamic> map) {
    return BusEkaModel(
      busNumber: map['busNumber'],
      startTime: map['startTime'],
      endTime: map['endTime'],
      waitingTime: map['waitingTime'],
      route: map['route'],
    );
  }

  String toJson() => json.encode(toMap());

  factory BusEkaModel.fromJson(String source) =>
      BusEkaModel.fromMap(json.decode(source));

  @override
  String toString() {
    return 'BusEkaModel(busNumber: $busNumber, startTime: $startTime, endTime: $endTime, waitingTime: $waitingTime, route: $route)';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is BusEkaModel &&
        other.busNumber == busNumber &&
        other.startTime == startTime &&
        other.endTime == endTime &&
        other.waitingTime == waitingTime &&
        other.route == route;
  }

  @override
  int get hashCode {
    return busNumber.hashCode ^
        startTime.hashCode ^
        endTime.hashCode ^
        waitingTime.hashCode ^
        route.hashCode;
  }
}
