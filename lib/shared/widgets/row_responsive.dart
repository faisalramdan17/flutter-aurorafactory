import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';

class XRowResponsive extends StatelessWidget {
  const XRowResponsive({
    required this.children,
    this.height,
    this.crossAxisAlignment = CrossAxisAlignment.center,
    this.mainAxisAlignment = MainAxisAlignment.start,
    this.mainAxisSize = MainAxisSize.max,
    Key? key,
  }) : super(key: key);

  final double? height;
  final List<Widget> children;
  final CrossAxisAlignment crossAxisAlignment;
  final MainAxisAlignment mainAxisAlignment;
  final MainAxisSize mainAxisSize;

  @override
  Widget build(BuildContext context) {
    if (XResponsive.isDesktop(context)) {
      return Row(
        crossAxisAlignment: crossAxisAlignment,
        mainAxisAlignment: mainAxisAlignment,
        mainAxisSize: mainAxisSize,
        children: children,
      );
    } else {
      return SizedBox(
        height: height,
        width: double.infinity,
        child: Column(
          crossAxisAlignment: crossAxisAlignment,
          mainAxisAlignment: mainAxisAlignment,
          mainAxisSize: mainAxisSize,
          children: children,
        ),
      );
    }
  }
}
