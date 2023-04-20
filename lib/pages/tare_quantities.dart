import 'package:flutter/material.dart';
import 'package:sp_demo_tsd/widgets/tare_quantity_table.dart';

import '../widgets/points_info.dart';

class TareQuantitiesPage extends StatelessWidget {
  const TareQuantitiesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: const Padding(
        padding: EdgeInsets.all(12.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PointsInfo(),
              SizedBox(height: 12),
              TareQuantityTable(),
            ],
          ),
        ),
      ),
      appBar: AppBar(
        title: const Text('Заполнение грузомест'),
      ),
    );
  }
}
