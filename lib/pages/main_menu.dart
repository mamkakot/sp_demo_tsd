import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:provider/provider.dart';
import 'package:sp_demo_tsd/widgets/menu_button.dart';

import '../main.dart';

class MainMenu extends StatelessWidget {
  const MainMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var mainMenuButtonsLabels = [
      "Выпуск",
      "Сборка",
      "Отгрузка",
      "Перемещение",
      "Списание",
      "Инвентаризация",
    ];
    var mainMenuButtons = [
      for (var label in mainMenuButtonsLabels) MenuButton(title: label),
      MenuButton(
          title: "Электронная ТрН",
          onClick: () => SchedulerBinding.instance.addPostFrameCallback((_) {
                Navigator.pushNamed(context, '/shipment');
              }))
    ];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Главное меню'),
      ),
      body: Center(
        child: ListView(
          children: mainMenuButtons,
        ),
      ),
    );
  }
}
