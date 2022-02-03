import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';

class XTextField extends StatelessWidget {
  const XTextField({
    this.label,
    this.hintText,
    this.initialValue,
    this.validator,
    this.controller,
    this.action,
    this.autocorrect,
    this.autofocus,
    this.enabled,
    this.obscureText,
    this.readOnly,
    this.expands,
    this.maxLines,
    this.minLines,
    this.maxLength,
    this.keyboardAppearance,
    this.textCapitalization,
    this.keyboardType,
    this.textAlign,
    Key? key,
  }) : super(key: key);

  final String? label, hintText, initialValue;
  final String? Function(String?)? validator;
  final TextEditingController? controller;
  final Widget? action;
  final bool? autocorrect, autofocus, enabled, obscureText, readOnly, expands;
  final int? maxLines, minLines, maxLength;
  final Brightness? keyboardAppearance;
  final TextInputType? keyboardType;
  final TextCapitalization? textCapitalization;
  final TextAlign? textAlign;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 0),
          child: Text(
            label ?? "",
            style: const TextStyle(fontSize: 15),
          ),
        ),
        Row(
          children: [
            Flexible(
              child: TextFormField(
                initialValue: initialValue,
                validator: validator,
                controller: controller,
                autocorrect: autocorrect ?? true,
                autofocus: autofocus ?? false,
                enabled: enabled,
                readOnly: readOnly ?? false,
                expands: expands ?? false,
                maxLines: maxLines,
                minLines: minLines,
                maxLength: maxLength,
                obscureText: obscureText ?? false,
                keyboardAppearance: keyboardAppearance,
                keyboardType: keyboardType,
                textCapitalization:
                    textCapitalization ?? TextCapitalization.none,
                textAlign: textAlign ?? TextAlign.start,
                decoration: InputDecoration(
                  contentPadding: const EdgeInsets.symmetric(horizontal: 12),
                  hintText: hintText ?? "",
                  fillColor: kSecondaryColor,
                  filled: true,
                  border: const OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.all(Radius.circular(10)),
                  ),
                ),
              ),
            ),
            action ?? Container(),
          ],
        ),
      ],
    );
  }
}
