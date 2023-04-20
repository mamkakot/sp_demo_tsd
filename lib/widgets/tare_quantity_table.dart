import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_demo_tsd/main.dart';
import 'package:sp_demo_tsd/models/all_models.dart';

import '../data/tares.dart';

class TareQuantityTable extends StatefulWidget {
  const TareQuantityTable({Key? key}) : super(key: key);

  @override
  State<TareQuantityTable> createState() => _TareQuantityTableState();
}

class _TareQuantityTableState extends State<TareQuantityTable> {
  int? sortColumnIndex;
  int? selectedRowIndex;
  bool isAscending = false;
  List<Tare> taresList = List.from(tares);
  List<TareQuantity>? tareQuantitiesList;

  @override
  Widget build(BuildContext context) {
    var appState = context.watch<MyAppState>();

    tareQuantitiesList = MyApp.tareQuantityList
            .where((tareQuantity) =>
                tareQuantity.unit == appState.chosenSubUnit &&
                tareQuantity.routePoint.gln == appState.chosenRoutePoint.gln &&
                tareQuantity.route == appState.chosenRouteDocument)
            .isEmpty
        ? [
            for (var tare in taresList)
              TareQuantity(
                  tare: tare,
                  routePoint: appState.chosenRoutePoint,
                  route: appState.chosenRouteDocument,
                  unit: appState.chosenSubUnit!,
                  quantity: 0)
          ]
        : MyApp.tareQuantityList
            .where((tareQuantity) =>
                tareQuantity.unit == appState.chosenSubUnit &&
                tareQuantity.routePoint.gln == appState.chosenRoutePoint.gln &&
                tareQuantity.route == appState.chosenRouteDocument)
            .toList();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: [
        SizedBox(
            width: MediaQuery.of(context).size.width, child: buildDataTable()),
      ],
    );
  }

  Widget buildDataTable() {
    final columns = [
      'Название тары',
      'Количество',
    ];
    return Material(
        child: DataTable(
      border: TableBorder.all(color: Colors.grey),
      headingRowColor: MaterialStateColor.resolveWith(
          (states) => Colors.amberAccent.withAlpha(42)),
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(columns),
      rows: getRows(tareQuantitiesList!),
      showBottomBorder: true,
    ));
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(label: Text(column), onSort: onSort))
      .toList();

  List<DataRow> getRows(List<dynamic> data) =>
      tareQuantitiesList!.map((TareQuantity tareQuantity) {
        final cells = [tareQuantity.tare.name, tareQuantity.quantity];
        return DataRow(cells: getCells(cells, tareQuantity));
      }).toList();

  List<DataCell> getCells(List<dynamic> cells, TareQuantity tareQ) =>
      cells.asMap().entries.map((entry) {
        int index = entry.key;
        var value = entry.value;
        return index == 0
            ? DataCell(Text('$value'))
            : DataCell(
                TextFormField(
                  initialValue: (value == null || value == 0) ? '' : '$value',
                  keyboardType: TextInputType.number,
                  onChanged: (value) {
                    tareQuantitiesList
                        ?.firstWhere((tareQuantity) => tareQuantity == tareQ)
                        .quantity = int.tryParse(value);
                    saveTareQuantities();
                  },
                ),
                showEditIcon: true);
      }).toList();

  void onSort(int columnIndex, bool ascending) {
    taresList.sort(
        (tare1, tare2) => compareStrings(ascending, tare1.name, tare2.name));

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareStrings(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);

  void saveTareQuantities() {
    tareQuantitiesList?.forEach((tareQuantity) {
      var foundTareQuantityIndex = MyApp.tareQuantityList.indexWhere(
          (globalTareQuantity) =>
              globalTareQuantity.unit == tareQuantity.unit &&
              globalTareQuantity.routePoint.gln ==
                  tareQuantity.routePoint.gln &&
              globalTareQuantity.route == tareQuantity.route &&
              globalTareQuantity.tare == tareQuantity.tare);
      if (foundTareQuantityIndex == -1) {
        MyApp.tareQuantityList.add(tareQuantity);
      } else {
        MyApp.tareQuantityList[foundTareQuantityIndex].quantity =
            tareQuantity.quantity;
      }
    });
    // Navigator.pop(context);
  }
}
