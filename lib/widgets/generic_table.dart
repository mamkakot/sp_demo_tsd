import 'package:flutter/material.dart';

class GenericTable extends StatefulWidget {
  const GenericTable(
      {Key? key,
      required this.data,
      required this.columns,
      this.onSelectChanged})
      : super(key: key);

  final List<dynamic> data;
  final List<String> columns;
  final Function(dynamic)? onSelectChanged;

  @override
  State<GenericTable> createState() => _GenericTableState();
}

class _GenericTableState extends State<GenericTable> {
  int? sortColumnIndex;
  int? selectedRowIndex;
  bool isAscending = false;
  List<dynamic>? data;

  @override
  Widget build(BuildContext context) {
    data = List.of(widget.data);
    return Material(
        child: DataTable(
      border: TableBorder.all(color: Colors.grey),
      headingRowColor: MaterialStateColor.resolveWith(
          (states) => Colors.amberAccent.withAlpha(42)),
      showCheckboxColumn: false,
      sortAscending: isAscending,
      sortColumnIndex: sortColumnIndex,
      columns: getColumns(widget.columns),
      rows: getRows(data!),
      showBottomBorder: true,
    ));
  }

  List<DataColumn> getColumns(List<String> columns) => columns
      .map((String column) => DataColumn(label: Text(column), onSort: onSort))
      .toList();

  List<DataRow> getRows(List<dynamic> data) => data.map((element) {
        final cells = [element.name];
        return DataRow(
            cells: getCells(cells, element.color),
            onSelectChanged: (_) {
              print(element.name);
              widget.onSelectChanged!(element);
            });
      }).toList();

  List<DataCell> getCells(List<dynamic> cells, [Color? color]) => cells
      .map((data) => DataCell(
          Text('$data', style: TextStyle(color: color ?? Colors.black))))
      .toList();

  void onSort(int columnIndex, bool ascending) {
    data?.sort((firstObject, secondObject) =>
        compareStrings(ascending, firstObject.name, secondObject.name));

    setState(() {
      sortColumnIndex = columnIndex;
      isAscending = ascending;
    });
  }

  int compareStrings(bool ascending, String firstValue, String secondValue) =>
      ascending
          ? firstValue.compareTo(secondValue)
          : secondValue.compareTo(firstValue);
}
