import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

class ApproveAccountForm extends GetView<IntractTokenController> {
  const ApproveAccountForm({
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
            title: "Approve Account",
            subtitle:
                "Approve account to withdraw multiple times up to the specified amount.",
          ),
          XRowResponsive(
            height: 210,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Flexible(
                child: XTextField(
                  controller: controller.transToAddressCtrl,
                  label: "To Address",
                  hintText: "e.g : 0x1ceb00da...",
                  validator: MultiValidator([
                    RequiredValidator(
                        errorText: 'To address field is required'),
                    MinLengthValidator(33,
                        errorText:
                            'To address must be at least 33 digits long'),
                  ]),
                ),
              ),
              const SizedBox(width: 15),
              Flexible(
                child: XTextField(
                  controller: controller.transAmountCtrl,
                  label: "Amount",
                  hintText: "e.g : 10",
                  validator: MultiValidator([
                    RequiredValidator(errorText: 'Amount field is required'),
                    PatternValidator(r'^(|\d+)$',
                        errorText: 'Total supplay must be bigger or than 0'),
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
                    // If the form is valid, display a snackbar. In the real world,
                    // you'd often call a server or save the information in a database.
                    ScaffoldMessenger.of(context).showSnackBar(
                      const SnackBar(content: Text('Processing Data')),
                    );
                  }
                },
                label: const Text("Approve Account"),
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
