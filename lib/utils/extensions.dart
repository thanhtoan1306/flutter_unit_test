extension HardCoded on String {
  String get hardCoded {
    return this;
  }
}

extension StringExtension on String? {
  bool get isNullOrEmpty => this == null || this!.isEmpty;
}
