import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddTokenController extends GetxController {
  static AddTokenController to = Get.find();

  late TextEditingController tokenNameCtrl,
      tokenSymbolCtrl,
      tokenDecimalCtrl,
      tokenSupplyCtrl;

  @override
  void onInit() {
    tokenNameCtrl = TextEditingController();
    tokenSymbolCtrl = TextEditingController();
    tokenDecimalCtrl = TextEditingController();
    tokenSupplyCtrl = TextEditingController();
    super.onInit();
  }

  void addTokenContract() async {
    //   ResponseTokenContract data = await TokenController.to.tokenRepository
    //       .getTokenContract(tokenContractAddressCtrl.text);
    //   tokenContract = data.tokenContract;
    //   update();
  }

  // @override
  // void onClose() {
  //   // tokenNameCtrl.dispose();
  //   // tokenSymbolCtrl.dispose();
  //   // tokenDecimalCtrl.dispose();
  //   // tokenSupplyCtrl.dispose();
  //   // tokenContract = null;
  //   super.onClose();
  // }

}
