import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class XHelper {
  static Color generateRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }

  static void copyText(String text) {
    Clipboard.setData(ClipboardData(text: text));
  }
}
