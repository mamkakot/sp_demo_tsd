import 'package:sp_demo_tsd/models/all_models.dart';

// class to represent a "Рейс" document
class RouteDocument {
  RouteDocument({
    required this.name,
    required this.autoNumber,
    required this.autoType,
    required this.driverName,
    required this.routeTime,
    required this.routePoints,
    required this.units,
    required this.status,
    this.installedSeal,
    required this.areDocsCreated,
  });

  final String name;
  final String autoNumber;
  final String autoType;
  final String driverName;
  final DateTime routeTime;
  final List<RoutePoint> routePoints;
  final List<Unit> units;
  String? installedSeal;
  String status;
  bool areDocsCreated = false;
}
