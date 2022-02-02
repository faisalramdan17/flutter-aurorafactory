import 'dart:math';

import 'package:flutter/material.dart';

class XHelper {
  static Color generateRandomColor() {
    return Colors.primaries[Random().nextInt(Colors.primaries.length)];
  }
}
