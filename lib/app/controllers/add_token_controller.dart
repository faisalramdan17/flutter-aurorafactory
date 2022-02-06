import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
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

    // tokenNameCtrl.text = "Token Baru Kaya";
    // tokenSymbolCtrl.text = "JKL";
    tokenDecimalCtrl.text = "18";
    tokenSupplyCtrl.text = "1000";
    super.onInit();
  }

  void addTokenContract() async {
    await XProgressHud.show();
    final abi = [
      '''function deployNewERC20Token(
          string calldata name,
          string calldata symbol,
          uint8 decimals,
          uint256 initialSupply
      ) public returns (address)''',
      'function name() external view returns (string memory)',
    ];

    String address = "0xaE074f630CCe25260463cc69cC6E765fA5Cf28Ad";
    Contract contract = Contract(address, abi, provider!.getSigner());
    dynamic result = await contract.call<dynamic>(
      'deployNewERC20Token',
      [
        tokenNameCtrl.text,
        tokenSymbolCtrl.text.toUpperCase(),
        BigInt.parse(tokenDecimalCtrl.text),
        BigInt.parse(tokenSupplyCtrl.text),
      ],
    );
    await XProgressHud.hide();

    if (result != null) {
      Get.rootDelegate.toNamed(Routes.DASBOARD);
      // to close the drawer
      Navigator.of(Get.context!).pop();
    }
    update();
  }
}
