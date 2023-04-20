import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class PointsInfo extends StatelessWidget {
  const PointsInfo({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    return Card(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Row(
          children: [
            const Column(
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                Text('Склад отгрузки: ',
                    style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Точка доставки: ',
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
            Flexible(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    appState.chosenSubUnit!.name,
                    textAlign: TextAlign.left,
                    overflow: TextOverflow.ellipsis,
                  ),
                  Text(appState.chosenRoutePoint.name,
                      textAlign: TextAlign.left)
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
