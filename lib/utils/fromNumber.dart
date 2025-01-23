String formatNumber(dynamic value, {int decimalPlaces = 4}) {
  if (value is String) {
    value = num.tryParse(value) ?? 0;
  } else if (value is! num) {
    throw ArgumentError('Invalid value type. Expected num or String.');
  }

  String formattedNumber;

  // 处理整数部分，避免四舍五入
  if (decimalPlaces == 0 || value is int) {
    formattedNumber = value.toStringAsFixed(0).replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+$)'), (Match match) => '${match[1]},');
  } else {
    // 对数字进行处理，保留原始小数部分，避免四舍五入
    String valueStr = value.toString();
    List<String> parts = valueStr.split('.');

    // 处理小数部分，截取到指定的小数位
    String integerPart = parts[0]; // 整数部分
    String decimalPart = parts.length > 1 ? parts[1] : ''; // 小数部分
    if (decimalPart.length > decimalPlaces) {
      decimalPart = decimalPart.substring(0, decimalPlaces);
    }

    // 处理千分位分隔符
    integerPart = integerPart.replaceAllMapped(
        RegExp(r'(\d)(?=(\d{3})+$)'), (Match match) => '${match[1]},');

    // 拼接整数部分和小数部分
    formattedNumber =
        '$integerPart${decimalPart.isNotEmpty ? '.' + decimalPart : ''}';
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
