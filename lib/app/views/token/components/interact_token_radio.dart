import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class InteractTokenRadio extends GetView<IntractTokenController> {
  const InteractTokenRadio({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<IntractTokenController>(builder: (context) {
      return Column(
        children: [
          const Padding(
            padding: EdgeInsets.only(top: 10.0),
            child: Divider(height: 35),
          ),
          XRowResponsive(
            height: 220,
            children: [
              Flexible(
                child: RadioListTile<TokenInteraction>(
                  title: const Text(
                    'Check Balance',
                    style: TextStyle(fontSize: 14),
                  ),
                  value: TokenInteraction.checkBalance,
                  groupValue: controller.tokenInteraction,
                  onChanged: controller.setTokenIntraction,
                  activeColor: kPrimary2Color,
                ),
              ),
              Flexible(
                child: RadioListTile<TokenInteraction>(
                  title: const Text(
                    'Transfer Token',
                    style: TextStyle(fontSize: 14),
                  ),
                  value: TokenInteraction.transferToken,
                  groupValue: controller.tokenInteraction,
                  onChanged: controller.setTokenIntraction,
                  activeColor: kPrimary2Color,
                ),
              ),
              Flexible(
                child: RadioListTile<TokenInteraction>(
                  title: const Text(
                    'Approve Account',
                    style: TextStyle(fontSize: 14),
                  ),
                  value: TokenInteraction.approveAccount,
                  groupValue: controller.tokenInteraction,
                  onChanged: controller.setTokenIntraction,
                  activeColor: kPrimary2Color,
                ),
              ),
              Flexible(
                child: RadioListTile<TokenInteraction>(
                  title: const Text(
                    'Check Allowance',
                    style: TextStyle(fontSize: 14),
                  ),
                  value: TokenInteraction.checkAllowance,
                  groupValue: controller.tokenInteraction,
                  onChanged: controller.setTokenIntraction,
                  activeColor: kPrimary2Color,
                ),
              ),
              Flexible(
                child: RadioListTile<TokenInteraction>(
                  title: const Text(
                    'Transfer Allowance',
                    style: TextStyle(fontSize: 14),
                  ),
                  value: TokenInteraction.transferAllowance,
                  groupValue: controller.tokenInteraction,
                  onChanged: controller.setTokenIntraction,
                  activeColor: kPrimary2Color,
                ),
              ),
            ],
          ),
          const Padding(
            padding: EdgeInsets.only(top: 0.0),
            child: Divider(height: 35),
          ),
        ],
      );
    });
  }
}
