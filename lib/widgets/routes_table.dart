import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sp_demo_tsd/main.dart';
import 'package:sp_demo_tsd/models/all_models.dart';

class RoutesTable extends StatefulWidget {
  const RoutesTable({Key? key}) : super(key: key);

  @override
  State<RoutesTable> createState() => _RoutesTableState();
}

class _RoutesTableState extends State<RoutesTable> {
  late MyAppState appState;

  int? sortColumnIndex;
  int? selectedRowIndex;
  bool isAscending = false;
  BoxConstraints? _constraints;

  @override
  void didChangeDependencies() {
    appState = context.watch<MyAppState>();
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return buildDataTable();
  }

  Widget buildDataTable() {
    return LayoutBuilder(builder: (context, constraints) {
      _constraints = constraints;

      var columns = _constraints!.maxWidth >= 450
          ? [
              'Название',
              'Дата',
              'Номер ТС',
              'Способ хранения',
              'Водитель',
              'Статус'
            ]
          : ['Статус', 'Название'];

      return appState.routes.isEmpty
          ? const Card(
              color: Colors.orangeAccent,
              child: Center(
                child: Padding(
                  padding: EdgeInsets.all(12.0),
                  child: Text(
                    'Рейсов для выбранного подразделения за выбранный период не найдено.',
                    textAlign: TextAlign.center,
                  ),
                ),
              ),
            )
          : Material(
              child: DataTable(
                  border: TableBorder.all(color: Colors.grey),
                  headingRowColor: MaterialStateColor.resolveWith(
                      (states) => Colors.amberAccent.withAlpha(42)),
                  showCheckboxColumn: false,
                  sortAscending: isAscending,
                  sortColumnIndex: sortColumnIndex,
                  columns: getColumns(columns),
                  rows: getRows(appState.routes),
                  showBottomBorder: true),
            );
    });
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(label: Text(column), onSort: onSort))
      .toList();

  List<DataRow> getRows(List<RouteDocument> routes) =>
      routes.map((RouteDocument route) {
        final cells = _constraints!.maxWidth >= 450
            ? [
                route.status,
                route.name,
                MyApp.formatter.format(route.routeTime),
                route.autoNumber,
                route.autoType,
                route.driverName
              ]
            : [route.status, route.name];
        print(appState.startingDate);
        return DataRow(
            cells: getCells(cells),
            onSelectChanged: (_) {
              print(route.name);
              appState.chosenRouteDocument = route;

              Navigator.pushNamed(context, '/units_selection');
            });
      }).toList();

  List<DataCell> getCells(List<dynamic> cells) =>
      cells.map((data) => DataCell(Text('$data'))).toList();

  // TODO: make it dynamic, cause I don't really like it as it is
  void onSort(int columnIndex, bool ascending) {
    if (columnIndex == 0) {
      appState.routes.sort((route1, route2) =>
          compareStrings(ascending, route1.status, route2.status));
    } else if (columnIndex == 1) {
      appState.routes.sort((route1, route2) =>
          compareStrings(ascending, route1.name, route2.name));
    } else if (columnIndex == 2) {
      appState.routes.sort((route1, route2) => compareStrings(
          ascending, '${route1.routeTime}', '${route2.routeTime}'));
    } else if (columnIndex == 3) {
      appState.routes.sort((route1, route2) =>
          compareStrings(ascending, route1.autoNumber, route2.autoNumber));
    } else if (columnIndex == 4) {
      appState.routes.sort((route1, route2) =>
          compareStrings(ascending, route1.autoType, route2.autoType));
    } else if (columnIndex == 5) {
      appState.routes.sort((route1, route2) =>
          compareStrings(ascending, route1.driverName, route2.driverName));
    }
    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareStrings(bool ascending, String value1, String value2) =>
      ascending ? value1.compareTo(value2) : value2.compareTo(value1);
}
