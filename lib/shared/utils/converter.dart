import 'package:intl/intl.dart';

class XConverter {
  static String numberSupply(double input,
      {int decimal = 2, isAbbreviation = false}) {
    int decimalCount = 1;
    for (int x = 1; x <= decimal; x++) {
      decimalCount *= 10;
    }
    double _input = input / decimalCount;
    int inputLength = _input.toString().length;

    String symbol = "";
    if (isAbbreviation && inputLength > 4) {
      int check = (inputLength / 3).floor();
      decimal = 2;
      List<String> listSymbol = [
        "K",
        "M",
        "B",
        "T",
        "Quadrillion",
        "Quintillion"
      ];
      _input /= quadratic(1000, check);
      symbol = listSymbol[check - 1];
    }

    return numberFormat(_input, decimal) + symbol;
  }

  static String numberFormat(double input, [int decimal = 2]) {
    String decimalString = ".";
    for (int x = 1; x <= decimal; x++) {
      decimalString += "#";
    }
    var f = NumberFormat("#,###$decimalString", "en_US");
    return f.format(input);
  }

  static double quadratic(double input, int decimal) {
    double count = 1;
    for (int x = 1; x <= decimal; x++) {
      count *= input;
    }
    return count;
  }
}
