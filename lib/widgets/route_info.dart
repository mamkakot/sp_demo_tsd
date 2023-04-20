import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../main.dart';

class RouteInfo extends StatelessWidget {
  const RouteInfo({Key? key}) : super(key: key);

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
                Text('Название рейса: ', style: TextStyle(fontWeight: FontWeight.bold),),
                Text('ФИО водителя: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Рег. номер ТС: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Тип ТС: ', style: TextStyle(fontWeight: FontWeight.bold)),
                Text('Дата отгрузки: ', style: TextStyle(fontWeight: FontWeight.bold)),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(appState.chosenRouteDocument.name, textAlign: TextAlign.left,),
                Text(appState.chosenRouteDocument.driverName, textAlign: TextAlign.left),
                Text(appState.chosenRouteDocument.autoNumber),
                Text(appState.chosenRouteDocument.autoType),
                Text(
                    MyApp.formatter.format(appState.chosenRouteDocument.routeTime)),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
