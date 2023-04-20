import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_demo_tsd/main.dart';
import 'package:sp_demo_tsd/models/all_models.dart';
import 'package:sp_demo_tsd/widgets/generic_table.dart';

class UnitsTable extends StatefulWidget {
  const UnitsTable({Key? key}) : super(key: key);

  @override
  State<UnitsTable> createState() => _UnitsTableState();
}

class _UnitsTableState extends State<UnitsTable> {
  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    final units = appState.chosenRouteDocument.units
        .firstWhere((Unit unit) => unit.name == appState.chosenUnit.name)
        .units
        ?.toList();
    for (var unit in units!) {
      if (MyApp.tareQuantityList
              .map((el) => el.routePoint.gln)
              .toSet()
              .containsAll(
                  appState.chosenRouteDocument.routePoints.map((e) => e.gln)) &&
          MyApp.tareQuantityList
                  .indexWhere((element) => element.unit == unit) !=
              -1) {
        unit.color = Colors.green;
      }
    }

    final columns = [
      'Название склада отгрузки',
    ];

    return GenericTable(
      data: units,
      columns: columns,
      onSelectChanged: (value) {
        appState.chosenSubUnit = value;
        Navigator.pushNamed(context, '/route_point_selection')
            .then((value) => setState(() {}));
      },
    );
  }
}
