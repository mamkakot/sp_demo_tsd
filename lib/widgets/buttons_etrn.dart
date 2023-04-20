import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_demo_tsd/main.dart';

class EtrnButtons extends StatefulWidget {
  const EtrnButtons({Key? key}) : super(key: key);

  @override
  State<EtrnButtons> createState() => _EtrnButtonsState();
}

class _EtrnButtonsState extends State<EtrnButtons> {
  bool _areButtonsDisabled = true;
  bool _areDocsPrinted = false;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();
    var u = appState.chosenUnit.units!;
    _areButtonsDisabled = _areDocsPrinted &&
        !(MyApp.tareQuantityList
            .map((e) => e.unit.color)
            .toSet()
            .containsAll(u));

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        ElevatedButton(
            onPressed: _areButtonsDisabled
                ? null
                : () {
                    final snackBar = SnackBar(
                      content: const Text(
                          'ЭТрН созданы. Ожидайте изменение статуса рейса на "ЭТрН подписаны ТК"'),
                      action: SnackBarAction(
                        label: 'Закрыть',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    setState(() {
                      _areDocsPrinted = true;
                    });
                  },
            child: const Text('Создать ЭТрН')),
        ElevatedButton(
            onPressed: _areButtonsDisabled
                ? null
                : () {
                    final snackBar = SnackBar(
                      content: const Text('Сводная ТрН отправлена на печать.'),
                      action: SnackBarAction(
                        label: 'Закрыть',
                        onPressed: () {
                          // Some code to undo the change.
                        },
                      ),
                    );
                    ScaffoldMessenger.of(context).showSnackBar(snackBar);
                    setState(() {
                      _areDocsPrinted = true;
                    });
                  },
            child: const Text('Печать сводной ТрН')),
      ],
    );
  }
}
