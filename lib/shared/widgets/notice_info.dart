import 'package:flutter/material.dart';

class XNoticeInfo extends StatelessWidget {
  const XNoticeInfo({
    required this.children,
    this.backgrounColor,
    Key? key,
  }) : super(key: key);

  final List<Widget> children;
  final Color? backgrounColor;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      decoration: BoxDecoration(
        color: backgrounColor ?? Colors.white12,
        borderRadius: BorderRadius.circular(10),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: children,
      ),
    );
  }
}
