// global location number
// might contain only a base value or both a base and child values if a unit is
// a subordinate to a store
class Gln {
  const Gln({required this.base, this.child});

  final String base;
  final String? child;
}