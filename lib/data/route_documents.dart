import 'package:sp_demo_tsd/data/route_statuses.dart';
import 'package:sp_demo_tsd/models/all_models.dart';
import 'package:sp_demo_tsd/data/route_points.dart';
import 'package:sp_demo_tsd/data/units.dart';

List<RouteDocument> routeDocuments = [
  RouteDocument(
    name: "№АВТО КФ 02 Красноярск",
    routePoints: List.from(routePoints),
    units: units,
    autoNumber: "А001АА 124",
    driverName: "Иванов Иван Иванович",
    routeTime: DateTime.now().add(const Duration(hours: 2)),
    autoType: "Замороженный",
    status: routeStatuses[0],
    areDocsCreated: false,
  ),
  RouteDocument(
    name: "№АВТО КФ 05 Красноярск",
    routePoints: List.from(routePoints),
    units: units2,
    autoNumber: "А002АА 124",
    driverName: "Петров Иван Иванович",
    routeTime: DateTime.now().add(const Duration(hours: 1)),
    autoType: "Охлаждаемый",
    status: routeStatuses[0],
    areDocsCreated: false,
  ),
  RouteDocument(
    name: "№АВТО КФ 01 Красноярск",
    routePoints: List.from(routePoints),
    units: units3,
    autoNumber: "А003АА 124",
    driverName: "Сидоров Иван Иванович",
    routeTime: DateTime.now().add(const Duration(hours: 3)),
    autoType: "Охлаждаемый",
    status: routeStatuses[0],
    areDocsCreated: false,
  ),
  RouteDocument(
    name: "№АВТО КФ 21 Красноярск",
    routePoints: List.from(routePoints),
    units: units4,
    autoNumber: "А004АА 124",
    driverName: "Петров Иван Иванович",
    routeTime: DateTime.now(),
    autoType: "Охлаждаемый",
    status: routeStatuses[0],
    areDocsCreated: false,
  ),
  RouteDocument(
    name: "№АВТО КФ 23 Красноярск",
    routePoints: List.from(routePoints),
    units: units5,
    autoNumber: "А005АА 124",
    driverName: "Сидоров Иван Иванович",
    routeTime: DateTime.now().add(const Duration(minutes: 42)),
    autoType: "Замороженный",
    status: routeStatuses[0],
    areDocsCreated: false,
  ),
];
