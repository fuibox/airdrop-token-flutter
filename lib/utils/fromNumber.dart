String formatNumber(dynamic value, {int decimalPlaces = 4}) {
  if (value is String) {
    value = num.tryParse(value) ?? 0;
  } else if (value is! num) {
    throw ArgumentError('Invalid value type. Expected num or String.');
  }

  String formattedNumber;

  if (decimalPlaces == 0) {
    formattedNumber = value.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+$)'), (Match match) => '${match[1]},');
  } else {
    double truncatedValue = double.parse(value.toStringAsFixed(decimalPlaces));
    formattedNumber = truncatedValue
        .toStringAsFixed(decimalPlaces)
        .replaceAllMapped(
            RegExp(r'(\d)(?=(\d{3})+\.)'), (Match match) => '${match[1]},');
  }

  return formattedNumber;
}
