import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_demo_tsd/data/route_points.dart';

import '../main.dart';
import '../models/route_point.dart';
import 'generic_table.dart';

class RoutePointsTable extends StatefulWidget {
  const RoutePointsTable({Key? key}) : super(key: key);

  @override
  State<RoutePointsTable> createState() => _RoutePointsTableState();
}

class _RoutePointsTableState extends State<RoutePointsTable> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final columns = [
      'Название точки доставки',
    ];

    var routePts = routePoints.map((e) => RoutePoint.clone(e)).toList();

    for (var routePoint in routePts) {
      var inx = MyApp.tareQuantityList
          .where((element) => element.routePoint.gln == routePoint.gln)
          .toList();
      if (inx.isNotEmpty &&
          inx.map((e) => e.unit).contains(appState.chosenSubUnit)) {
        routePoint.color = Colors.green;
      }
    }

    return GenericTable(
      data: routePts,
      columns: columns,
      onSelectChanged: (value) {
        appState.chosenRoutePoint = value;
        Navigator.pushNamed(context, '/tare_quantities').then((value) => setState(() {}));
      },
    );
  }
}
