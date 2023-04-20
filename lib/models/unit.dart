import 'dart:ui';

import 'package:sp_demo_tsd/models/all_models.dart';

// class to represent a unit of a working structure of company
class Unit {
  Unit({required this.name, this.gln, this.units, this.color});

  final String name;
  final List<Unit>? units;
  final Gln? gln;
  Color? color;

  factory Unit.clone(Unit source) {
    return Unit(
        name: source.name,
        gln: source.gln,
        color: source.color,
        units: source.units);
  }
}
