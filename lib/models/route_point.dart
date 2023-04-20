import 'dart:ui';

import 'package:sp_demo_tsd/models/all_models.dart';

// class to represent a route point -- where should driver deliver a product
class RoutePoint {
  RoutePoint({required this.name, required this.gln, this.color});

  final String name;
  final Gln gln;
  Color? color;

  factory RoutePoint.clone(RoutePoint source) {
    return RoutePoint(name: source.name, gln: source.gln, color: source.color);
  }
}
