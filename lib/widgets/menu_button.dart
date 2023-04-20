import 'package:flutter/material.dart';

class MenuButton extends StatelessWidget {
  final void Function()? onClick;

  const MenuButton({Key? key, required this.title, this.onClick})
      : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return TextButton(
        onPressed: onClick ??
            () => showDialog<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return AlertDialog(
                      title: const Text('В этом приложении не реализовано'),
                      content: const Text(
                          'Кнопка в демо-приложении ничего не выполняет.'),
                      actions: <Widget>[
                        TextButton(
                          style: TextButton.styleFrom(
                            textStyle: Theme.of(context).textTheme.labelLarge,
                          ),
                          child: const Text('Закрыть'),
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                        ),
                      ],
                    );
                  },
                ),
        child: Text(
          title,
          style: const TextStyle(fontSize: 32, color: Colors.green),
        ));
  }
}
