import 'package:sp_demo_tsd/models/all_models.dart';

// class to represent how many containers are to be delivered
// from a unit to a route point
class TareQuantity {
  TareQuantity(
      {required this.route,
      required this.tare,
      required this.routePoint,
      required this.unit,
      this.quantity});

  final Tare tare;
  int? quantity;
  final RoutePoint routePoint;
  final RouteDocument route;
  final Unit unit;
}
