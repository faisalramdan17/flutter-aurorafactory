import 'dart:math';

import 'package:flutter/material.dart';

class XInitialTextIcon extends StatelessWidget {
  const XInitialTextIcon({
    this.text,
    this.size = 30,
    this.fontSize,
    this.color,
    this.colorBackground,
    Key? key,
  }) : super(key: key);

  final String? text;
  final double? size, fontSize;
  final Color? color, colorBackground;

  @override
  Widget build(BuildContext context) {
    Color randomColor =
        Colors.primaries[Random().nextInt(Colors.primaries.length)];

    return Container(
      height: size,
      width: size,
      decoration: BoxDecoration(
          color: colorBackground ?? randomColor.withOpacity(0.3),
          borderRadius: BorderRadius.circular(6)),
      child: Center(
        child: Text(
          text?.length == 1
              ? (text?.toLowerCase() ?? "")
              : text?.substring(0, 2).toUpperCase() ?? "",
          style: TextStyle(
            fontSize: fontSize,
            color: color ?? randomColor,
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
    );
  }
}
