import 'package:sp_demo_tsd/models/all_models.dart';
// class to represent a "ЭТрН" document
class ElectronicWaybill {
  const ElectronicWaybill(this.name,
      this.deliveryDate,
      this.senderAddress,
      this.route,
      this.routePoint,
      this.containerCount,
      this.accompanyingDocuments);

  final String name;
  final DateTime deliveryDate;
  final String senderAddress;
  final RouteDocument route;
  final RoutePoint routePoint;
  final List<RealizationDocument> accompanyingDocuments;
  final int containerCount;
}