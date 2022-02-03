import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class IntractTokenController extends GetxController {
  static IntractTokenController to = Get.find();
  TokenInteraction tokenInteraction = TokenInteraction.transferToken;
  TokenContract? tokenContract;

  late TextEditingController tokenContractAddressCtrl,
      transFromAddressCtrl,
      transToAddressCtrl,
      transAmountCtrl,
      ownerAddressCtrl,
      spenderAddressCtrl;

  @override
  void onInit() {
    tokenContractAddressCtrl = TextEditingController();
    transToAddressCtrl = TextEditingController();
    transFromAddressCtrl = TextEditingController();
    transAmountCtrl = TextEditingController();
    ownerAddressCtrl = TextEditingController();
    spenderAddressCtrl = TextEditingController();
    super.onInit();
  }

  void setTokenIntraction(TokenInteraction? value) {
    tokenInteraction = value!;
    update();
  }

  void getTokenContract() async {
    ResponseTokenContract data = await TokenController.to.tokenRepository
        .getTokenContract(tokenContractAddressCtrl.text);
    tokenContract = data.tokenContract;
    update();
  }
}
