import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';

class XActionButton extends StatelessWidget {
  const XActionButton({
    required this.label,
    required this.icon,
    required this.onPressed,
    this.iconSize = 20,
    this.padding,
    Key? key,
  }) : super(key: key);

  final Text label;
  final IconData icon;
  final double? iconSize;
  final EdgeInsetsGeometry? padding;
  final void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: padding,
      child: ElevatedButton.icon(
        style: TextButton.styleFrom(
          backgroundColor: kPrimaryColor,
          padding: EdgeInsets.symmetric(
            horizontal: kDefaultPadding * 1.5,
            vertical: kDefaultPadding / (XResponsive.isMobile(context) ? 2 : 1),
          ),
        ),
        onPressed: onPressed,
        icon: Icon(
          icon,
          size: iconSize,
        ),
        label: label,
      ),
    );
  }
}
