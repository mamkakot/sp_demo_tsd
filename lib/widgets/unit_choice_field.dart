import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_demo_tsd/data/route_documents.dart';
import 'package:sp_demo_tsd/data/route_statuses.dart';
import 'package:sp_demo_tsd/models/all_models.dart';
import 'package:sp_demo_tsd/pages/shipment.dart';
import '../data/units.dart';
import '../main.dart';

// a widget where user chooses the required unit
class UnitChoice extends StatelessWidget {
  const UnitChoice({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Material(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text("Подразделение"),
          SizedBox(width: 10),
          Flexible(fit: FlexFit.loose, child: DropdownElement())
        ],
      ),
    );
  }
}

class DropdownElement extends StatefulWidget {
  const DropdownElement({Key? key}) : super(key: key);

  @override
  State<DropdownElement> createState() => _DropdownElementState();
}

class _DropdownElementState extends State<DropdownElement> {
  Unit? dropdownValue = units.first;
  List<Unit> unitsList = units;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    return DropdownButton<Unit>(
      isExpanded: true,
      value: dropdownValue,
      items: units
          .map<DropdownMenuItem<Unit>>((Unit unit) => DropdownMenuItem(
              value: unit,
              child: Text(
                unit.name,
                overflow: TextOverflow.ellipsis,
                style: const TextStyle(
                    fontWeight: FontWeight.normal, fontSize: 14),
              )))
          .toList(),
      onChanged: (Unit? value) {
        setState(() {
          dropdownValue = value!;
          appState.chosenUnit = value;
          appState.updateRouteTable();
        });
      },
    );
  }
}
