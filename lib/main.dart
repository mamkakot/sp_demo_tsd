import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';
import 'package:sp_demo_tsd/data/route_documents.dart';
import 'package:sp_demo_tsd/models/all_models.dart';
import 'package:sp_demo_tsd/pages/main_menu.dart';
import 'package:sp_demo_tsd/pages/route_point_selection.dart';
import 'package:sp_demo_tsd/pages/shipment.dart';
import 'package:sp_demo_tsd/pages/tare_quantities.dart';
import 'package:sp_demo_tsd/pages/units_selection.dart';
import 'package:sp_demo_tsd/widgets/tare_quantity_table.dart';

import 'data/units.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  static final DateFormat formatter = DateFormat('dd.MM.yy HH:mm:ss');
  static List<TareQuantity> tareQuantityList = [];

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MyAppState(),
      child: MaterialApp(
        title: 'SP TSD Demo',
        initialRoute: '/',
        routes: {
          '/': (context) => const MainMenu(),
          '/shipment': (context) => const Shipment(),
          '/units_selection': (context) => const UnitSelectionPage(),
          '/route_point_selection': (context) =>
              const RoutePointSelectionPage(),
          '/tare_quantities': (context) => const TareQuantitiesPage(),
        },
        theme: ThemeData(
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
          useMaterial3: true,
        ),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}

class MyAppState extends ChangeNotifier {
  static final now = DateTime.now();
  var chosenUnit = units.first;
  var chosenSubUnit = units.first.units?.first;
  var chosenRouteDocument = routeDocuments.first;
  var chosenRoutePoint = routeDocuments.first.routePoints.first;

  var startingDate = DateTime(now.year, now.month, now.day);
  var endingDate = DateTime(now.year, now.month, now.day)
      .add(const Duration(days: 1))
      .subtract(const Duration(seconds: 1));

  var routes = routeDocuments
      .where((RouteDocument route) =>
          route.routeTime.isAfter(DateTime(now.year, now.month, now.day)) &&
          route.routeTime.isBefore(DateTime(now.year, now.month, now.day)
              .add(const Duration(days: 1))
              .subtract(const Duration(seconds: 1))) &&
          route.units.map((e) => e.name).contains(units.first.name))
      .toList();

  void setDates(DateTime startDate, DateTime endDate) {
    startingDate = startDate;
    endingDate = endDate;
  }

  void updateRouteTable() {
    routes = routeDocuments
        .where((RouteDocument route) =>
            route.routeTime.isAfter(startingDate) &&
            route.routeTime.isBefore(endingDate) &&
            route.units.map((e) => e.name).contains(chosenUnit.name))
        .toList();
    notifyListeners();
  }
}
