import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_demo_tsd/widgets/route_info.dart';
import 'package:sp_demo_tsd/widgets/routepoints_table.dart';
import 'package:sp_demo_tsd/widgets/units_table.dart';

import '../main.dart';
import '../widgets/buttons_etrn.dart';

class UnitSelectionPage extends StatelessWidget {
  const UnitSelectionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              RouteInfo(),
              SizedBox(height: 12),
              UnitsTable(),
              Divider(
                height: 20,
                thickness: 2,
                indent: 5,
                endIndent: 5,
                color: Colors.grey,
              ),
              EtrnButtons(),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Выбор склада отгрузки'),
      ),
    );
  }
}
