import 'package:flutter/material.dart';

class XTitleSubtitleForm extends StatelessWidget {
  const XTitleSubtitleForm({
    this.title,
    this.subtitle,
    Key? key,
  }) : super(key: key);

  final String? title, subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        title == null
            ? Container()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(
                  title!,
                  style: const TextStyle(
                      fontWeight: FontWeight.bold, fontSize: 18),
                ),
              ),
        subtitle == null
            ? Container()
            : Padding(
                padding: const EdgeInsets.symmetric(vertical: 8.0),
                child: Text(subtitle!),
              ),
      ],
    );
  }
}
