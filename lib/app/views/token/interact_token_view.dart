import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:get/get.dart';

import 'components/approve_account_form.dart';
import 'components/check_allowance_form.dart';
import 'components/check_balance_form.dart';
import 'components/interact_token_radio.dart';
import 'components/transfer_allowance_form.dart';
import 'components/transfer_token_form.dart';

class InteractTokenView extends GetView<IntractTokenController> {
  const InteractTokenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuController.to.scaffoldKey = GlobalKey<ScaffoldState>();
    final _tokenContractFormKey = GlobalKey<FormState>();
    final _formKey = GlobalKey<FormState>();

    return XLayout(
      title: "Interact with Token",
      isSearchable: false,
      child: GetBuilder<IntractTokenController>(
        builder: (controller) => Column(
          children: [
            Form(
              key: _tokenContractFormKey,
              child: XTextField(
                controller: controller.tokenContractAddressCtrl,
                label:
                    "Enter the address of the token contract you want to interact with:",
                hintText: "e.g : 0x1ceb00da...",
                validator: RequiredValidator(
                    errorText: 'Token contract address is required'),
                action: XActionButton(
                  onPressed: () {
                    if (_tokenContractFormKey.currentState!.validate()) {
                      controller.getTokenContract();
                      //   // Get.showSnackbar(const GetSnackBar(
                      //   //   message: "Processing Data",
                      //   // ));
                    }
                  },
                  label: const Text("Go to Token"),
                  icon: Icons.assignment_outlined,
                  padding: const EdgeInsets.only(left: 15.0),
                ),
              ),
            ),
            if (controller.tokenContract != null) buidBody(_formKey)
          ],
        ),
      ),
    );
  }

  Widget buidBody(GlobalKey<FormState> _formKey) {
    return Column(
      children: [
        buildContactAddresInfo(),
        const InteractTokenRadio(),
        if (controller.tokenInteraction == TokenInteraction.transferToken)
          TransferTokenForm(formKey: _formKey)
        else if (controller.tokenInteraction == TokenInteraction.approveAccount)
          ApproveAccountForm(formKey: _formKey)
        else if (controller.tokenInteraction == TokenInteraction.checkBalance)
          CheckBalanceForm(formKey: _formKey)
        else if (controller.tokenInteraction ==
            TokenInteraction.transferAllowance)
          TransferAllowanceForm(formKey: _formKey)
        else if (controller.tokenInteraction == TokenInteraction.checkAllowance)
          CheckAllowanceForm(formKey: _formKey)
        else
          Container(),
      ],
    );
  }

  Widget buildContactAddresInfo() {
    return Container(
      width: double.infinity,
      margin: const EdgeInsets.only(top: 15),
      padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
      decoration: BoxDecoration(
          color: Colors.white12, borderRadius: BorderRadius.circular(10)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
              "Interacting with token at address: ${controller.tokenContract!.contractAddress} (${controller.tokenContract!.symbol})"),
          Text(
              "Total Supply is:  ${XConverter.numberSupply(controller.tokenContract!.totalSupply!, decimal: controller.tokenContract!.decimals!)}"),
        ],
      ),
    );
  }
}
