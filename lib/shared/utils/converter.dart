import 'package:intl/intl.dart';

class XConverter {
  static String numberSupply(double input, [int decimal = 2]) {
    int decimalCount = 1;
    for (int x = 1; x <= decimal; x++) {
      decimalCount *= 10;
    }
    double _input = input / decimalCount;
    return numberFormat(_input, decimal);
  }

  static String numberFormat(double input, [int decimal = 2]) {
    String decimalString = ".";
    for (int x = 1; x <= decimal; x++) {
      decimalString += "#";
    }
    var f = NumberFormat("#,###$decimalString", "en_US");
    return f.format(input);
  }
}
