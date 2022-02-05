import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class CheckAllowanceForm extends GetView<IntractTokenController> {
  const CheckAllowanceForm({
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
            title: "Check Allowance",
            subtitle:
                "Check what amount has been approved for withdrawal between two accounts.",
          ),
          if (controller.resultCheckAllowance != null)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: XNoticeInfo(
                children: [
                  SelectableText(
                      "The amount is: ${XConverter.amountFromBigInt(controller.resultCheckAllowance!, controller.tokenContract!.decimals!)} ${controller.tokenContract!.symbol}"),
                ],
              ),
            ),
          XRowResponsive(
            height: 210,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: XTextField(
                  controller: controller.transAllowanceFromAddressCtrl,
                  label: "Owner Address",
                  hintText: "e.g : 0x1ceb00da...",
                  validator: MultiValidator([
                    RequiredValidator(
                        errorText: 'Owner address field is required'),
                    MinLengthValidator(33,
                        errorText:
                            'Owner address must be at least 33 digits long'),
                  ]),
                ),
              ),
              const SizedBox(width: 15),
              Flexible(
                child: XTextField(
                  controller: controller.transAllowanceToAddressCtrl,
                  label: "Spender Address",
                  hintText: "e.g : 0x1ceb00da...",
                  validator: MultiValidator([
                    RequiredValidator(
                        errorText: 'Spender address field is required'),
                    MinLengthValidator(33,
                        errorText:
                            'Spender address must be at least 33 digits long'),
                  ]),
                ),
              ),
            ],
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 7.0),
              child: XActionButton(
                onPressed: () {
                  if (_formKey.currentState!.validate()) {
                    controller.checkAllowance();
                  }
                },
                label: const Text("Transfer Allowance"),
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
