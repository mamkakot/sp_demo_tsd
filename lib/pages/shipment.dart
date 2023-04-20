import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_demo_tsd/main.dart';
import 'package:sp_demo_tsd/widgets/buttons_etrn.dart';
import 'package:sp_demo_tsd/widgets/route_date_picker.dart';
import 'package:sp_demo_tsd/widgets/routes_table.dart';
import 'package:sp_demo_tsd/widgets/unit_choice_field.dart';

class Shipment extends StatelessWidget {
  const Shipment({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Электронная ТрН'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const UnitChoice(),
              const RouteDatePicker(),
              const SizedBox(height: 12),
              SizedBox(
                  width: MediaQuery.of(context).size.width,
                  child: const RoutesTable()),
              TextButton(
                  onPressed: () => appState.updateRouteTable(),
                  child: const Text("Обновить список")),
            ],
          ),
        ),
      ),
    );
  }
}
