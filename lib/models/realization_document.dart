import 'package:sp_demo_tsd/models/all_models.dart';
// same as "РТиУ" document
class RealizationDocument {
  const RealizationDocument(this.name, this.dateTime, this.unit);

  final String name;
  final DateTime dateTime;
  final Unit unit;
}