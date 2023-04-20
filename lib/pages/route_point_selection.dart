import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_demo_tsd/data/tares.dart';
import 'package:sp_demo_tsd/main.dart';
import 'package:sp_demo_tsd/models/all_models.dart';
import 'package:sp_demo_tsd/widgets/routepoints_table.dart';
import 'package:sp_demo_tsd/widgets/unit_info.dart';

class RoutePointSelectionPage extends StatefulWidget {
  const RoutePointSelectionPage({Key? key}) : super(key: key);

  @override
  State<RoutePointSelectionPage> createState() =>
      _RoutePointSelectionPageState();
}

class _RoutePointSelectionPageState extends State<RoutePointSelectionPage> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const UnitInfo(),
              const SizedBox(height: 12),
              const RoutePointsTable(),
              TextButton(
                  onPressed: () {
                    var notAllFilled = appState.chosenRouteDocument.routePoints
                            .map((e) => e.color)
                            .where((element) => element == Colors.green)
                            .length !=
                        appState.chosenRouteDocument.routePoints.length;
                    if (notAllFilled) {
                      showDialog(
                          context: context,
                          builder: (BuildContext context) => AlertDialog(
                                title: const Text(
                                    "Количество грузомест не заполнено"),
                                content: const Text(
                                    "Для некоторых точек доставки не заполнено количество грузомест. Продолжить?"),
                                actions: <Widget>[
                                  TextButton(
                                    onPressed: () =>
                                        Navigator.pop(context, 'Cancel'),
                                    child: const Text('Отмена'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      var requiredRoutePoints = appState
                                          .chosenRouteDocument.routePoints
                                          .where((element) =>
                                              element.color != Colors.green)
                                          .toList();
                                      for (var routePoint
                                          in requiredRoutePoints) {
                                        for (var tare in tares) {
                                          MyApp.tareQuantityList.add(
                                              TareQuantity(
                                                  route: appState
                                                      .chosenRouteDocument,
                                                  tare: tare,
                                                  routePoint: routePoint,
                                                  unit: appState.chosenSubUnit!,
                                                  quantity: 0));
                                        }
                                      }
                                      Navigator.pop(context, 'OK');
                                      pup();
                                    },
                                    child: const Text('OK'),
                                  ),
                                ],
                              )).then((value) => setState(() {}));
                    } else {
                      pup();
                    }
                  },
                  child: const Text("Сохранить"))
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Выбор точки доставки'),
      ),
    );
  }

  void pup() {
    Navigator.pop(context);
  }
}
