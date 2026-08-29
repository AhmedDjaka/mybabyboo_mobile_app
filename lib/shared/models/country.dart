class Country {
  final String isoCode;
  final String name;
  final String dialCode;
  final String flag;
  final String example;

  const Country({
    required this.isoCode,
    required this.name,
    required this.dialCode,
    required this.flag,
    required this.example,
  });

  @override
  bool operator ==(Object other) =>
      identical(this, other) ||
      other is Country &&
          runtimeType == other.runtimeType &&
          isoCode == other.isoCode;

  @override
  int get hashCode => isoCode.hashCode;
}
