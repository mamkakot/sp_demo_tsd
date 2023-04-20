import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class UnitInfo extends StatelessWidget {
  const UnitInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Склад отгрузки: ',
                style: TextStyle(fontWeight: FontWeight.bold)),
            SizedBox(
              width: 200,
              child: Text(
                appState.chosenSubUnit!.name,
                textAlign: TextAlign.left,
                // overflow: TextOverflow.ellipsis,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
