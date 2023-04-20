import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_demo_tsd/main.dart';
import 'package:sp_demo_tsd/pages/shipment.dart';
import 'package:syncfusion_flutter_datepicker/datepicker.dart';

class RouteDatePicker extends StatefulWidget {
  const RouteDatePicker({Key? key}) : super(key: key);

  @override
  State<RouteDatePicker> createState() => _RouteDatePickerState();
}

class _RouteDatePickerState extends State<RouteDatePicker> {
  late MyAppState appState;

  @override
  void didChangeDependencies() {
    appState = context.watch<MyAppState>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Text(
                      'Начальная дата: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Text(
                      'Конечная дата: ',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(MyApp.formatter.format(appState.startingDate)),
                    Text(MyApp.formatter.format(appState.endingDate)),
                  ],
                ),
                IconButton(
                    onPressed: () => showDialog<String>(
                        context: context,
                        builder: (BuildContext context) => AlertDialog(
                              title: const Text('Выберите диапазон дат'),
                              content: Scaffold(
                                  body: SfDateRangePicker(
                                onSelectionChanged: onSelectionChanged,
                                selectionMode:
                                    DateRangePickerSelectionMode.range,
                                initialSelectedRange: PickerDateRange(
                                    appState.startingDate, appState.endingDate),
                              )),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () =>
                                      Navigator.pop(context, 'Cancel'),
                                  child: const Text('Отмена'),
                                ),
                                TextButton(
                                  onPressed: () {
                                    appState.updateRouteTable();
                                    Navigator.pop(context, 'OK');
                                  },
                                  child: const Text('OK'),
                                ),
                              ],
                            )),
                    icon: const Icon(Icons.edit_calendar_outlined)),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void onSelectionChanged(DateRangePickerSelectionChangedArgs args) {
    var startDate = DateTime.now();
    var endDate = DateTime.now();
    if (args.value is PickerDateRange) {
      startDate = args.value.startDate;
      endDate = args.value.endDate ??
          args.value.startDate
              .add(const Duration(days: 1))
              .subtract(const Duration(seconds: 1));
    } else if (args.value is DateTime) {
      startDate = args.value;
      endDate = (args.value as DateTime).add(const Duration(hours: 23));
    }

    appState.setDates(startDate, endDate);
  }
}
