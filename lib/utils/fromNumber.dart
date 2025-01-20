String formatNumber(dynamic value, {int decimalPlaces = 4}) {
  if (value is String) {
    value = num.tryParse(value) ?? 0;
  } else if (value is! num) {
    throw ArgumentError('Invalid value type. Expected num or String.');
  }

  String formattedNumber;

  if (decimalPlaces == 0 ||
      value is int ||
      value.toStringAsFixed(decimalPlaces).split('.').last ==
          '0' * decimalPlaces) {
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

String getImageUrlByCardId(int cardId) {
  switch (cardId) {
    case 1:
      return 'assets/images/card_btc.png';
    case 2:
      return 'assets/images/card_eeth.png';
    case 3:
      return 'assets/images/card_bnb.png';
    case 4:
      return 'assets/images/card_sol.png';
    case 5:
      return 'assets/images/card_ton.png';
    default:
      return 'assets/images/card_eth.png';
  }
}

String getNameByCardId(int cardId) {
  switch (cardId) {
    case 1:
      return 'BTC';
    case 2:
      return 'ETH';
    case 3:
      return 'BNB';
    case 4:
      return 'SOL';
    case 5:
      return 'TON';
    default:
      return '';
  }
}
