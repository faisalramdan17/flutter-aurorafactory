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

    tokenNameCtrl.text = "Token Coba Aja";
    tokenSymbolCtrl.text = "TCA";
    tokenDecimalCtrl.text = "18";
    tokenSupplyCtrl.text = "10";
    super.onInit();
  }

  void addTokenContract() async {
    // void addTokenContract({void Function()? onSucess}) async {

    await ProgressHud.show();
    String? result =
        await Web3DartController.to.transaction("deployNewERC20Token", [
      tokenNameCtrl.text,
      tokenSymbolCtrl.text.toUpperCase(),
      BigInt.parse(tokenDecimalCtrl.text),
      BigInt.parse(tokenSupplyCtrl.text),
    ]);
    if (result != null) {
      Get.rootDelegate.toNamed(Routes.DASBOARD);
      // to close the drawer
      Navigator.of(Get.context!).pop();
    }
    // if (onSucess != null) onSucess();
    await ProgressHud.hide();
    debugPrint("Result [addTokenContract()] = $result");
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
