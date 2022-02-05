import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class CheckBalanceForm extends GetView<IntractTokenController> {
  const CheckBalanceForm({
    Key? key,
    required GlobalKey<FormState> formKey,
  })  : _formKey = formKey,
        super(key: key);

  final GlobalKey<FormState> _formKey;

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const XTitleSubtitleForm(
            title: "Check Balance",
            subtitle: "Check balance of account.",
          ),
          if (controller.resultCheckBalance != null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: XNoticeInfo(
                children: [
                  SelectableText(
                      "The balance of account is: ${XConverter.amountFromBigInt(controller.resultCheckBalance!, controller.tokenContract!.decimals!)} ${controller.tokenContract!.symbol}"),
                ],
              ),
            ),
          XTextField(
            controller: controller.transBalanceAddressCtrl,
            label: "Address",
            hintText: "e.g : 0x1ceb00da...",
            validator: MultiValidator([
              RequiredValidator(errorText: 'To address field is required'),
              MinLengthValidator(33,
                  errorText: 'To address must be at least 33 digits long'),
            ]),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: XActionButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.getBalane();
                  }
                },
                label: const Text("Check Balance"),
                icon: Icons.check,
                padding: const EdgeInsets.only(top: 20.0),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
