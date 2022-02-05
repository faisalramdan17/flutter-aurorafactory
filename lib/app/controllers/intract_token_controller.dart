import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';

class IntractTokenController extends GetxController {
  static IntractTokenController to = Get.find();
  TokenInteraction tokenInteraction = TokenInteraction.checkBalance;
  ContractERC20? contractERC20;
  TokenContract? tokenContract;
  TransactionResponse? resultTransferToken;
  TransactionResponse? resultApproveAccount;
  BigInt? resultCheckBalance;
  TransactionResponse? resultTransferAllowance;
  BigInt? resultCheckAllowance;

  late TextEditingController tokenContractAddressCtrl,
      transBalanceAddressCtrl,
      transToAddressCtrl,
      transAmountCtrl,
      transApproveAmountCtrl,
      transAllowanceFromAddressCtrl,
      transAllowanceToAddressCtrl,
      transAllowanceAmountCtrl;

  @override
  void onInit() {
    tokenContractAddressCtrl = TextEditingController();
    transBalanceAddressCtrl = TextEditingController();
    transToAddressCtrl = TextEditingController();
    transAllowanceToAddressCtrl = TextEditingController();
    transAllowanceFromAddressCtrl = TextEditingController();
    transAmountCtrl = TextEditingController();
    transApproveAmountCtrl = TextEditingController();
    transAllowanceAmountCtrl = TextEditingController();
    super.onInit();
  }

  @override
  void onReady() {
    final String contractAddress =
        Get.rootDelegate.parameters["contractAddress"] ?? "";
    if (contractAddress.isNotEmpty) {
      tokenContractAddressCtrl.text = contractAddress;
      getContractToken(contractAddress);
    }
    super.onReady();
  }

  void setTokenIntraction(TokenInteraction? value) {
    tokenInteraction = value!;
    update();
  }

  void getContractToken([String? contractAddress]) async {
    await XProgressHud.show();
    String address = contractAddress ?? tokenContractAddressCtrl.text;
    contractERC20 = ContractERC20(address, provider!.getSigner());
    ResponseTokenContract data =
        await TokenController.to.tokenRepository.getTokenContract(address);
    tokenContract = data.tokenContract;
    await XProgressHud.hide();
    update();
  }

  void getBalane() async {
    await XProgressHud.show();
    resultCheckBalance =
        await contractERC20!.balanceOf(transBalanceAddressCtrl.text);
    await XProgressHud.hide();
    update();
  }

  void tranferToken() async {
    await XProgressHud.show();
    resultTransferToken = await contractERC20!.transfer(
      transToAddressCtrl.text,
      XConverter.amountToBigInt(transAmountCtrl.text, tokenContract!.decimals!),
    );
    await XProgressHud.hide();
    update();
  }

  void approveAccount() async {
    await XProgressHud.show();
    resultApproveAccount = await contractERC20!.approve(
      transAllowanceToAddressCtrl.text,
      XConverter.amountToBigInt(
          transApproveAmountCtrl.text, tokenContract!.decimals!),
    );
    await XProgressHud.hide();
    update();
  }

  void tranferAllowance() async {
    await XProgressHud.show();

    // resultTransferAllowance = await contractERC20!.transferFrom(
    //   transFromAddressCtrl.text,
    //   transToAddressCtrl.text,
    //   XConverter.amountToBigInt(transAmountCtrl.text, tokenContract!.decimals!),
    // );

    final abi = [
      '''function transferFrom(
        address sender,
        address recipient,
        uint256 amount
    ) external returns (bool)''',
    ];

    String address = tokenContract!.contractAddress;
    Contract contract = Contract(address, abi, provider!.getSigner());

    resultTransferAllowance = await contract.send(
      'transferFrom',
      [
        transAllowanceFromAddressCtrl.text,
        transAllowanceToAddressCtrl.text,
        XConverter.amountToBigInt(
            transAllowanceAmountCtrl.text, tokenContract!.decimals!),
      ],
    );

    // print(" result ==> ${resultTransferAllowance?.hash}");
    // print("TransactionResponse = ${resultTransferAllowance?.data}");
    // print("TransactionResponse Hash = ${resultTransferAllowance?.hash}");
    await XProgressHud.hide();
    update();
  }

  void checkAllowance() async {
    await XProgressHud.show();
    resultCheckAllowance = await contractERC20!.allowance(
      transAllowanceFromAddressCtrl.text,
      transAllowanceToAddressCtrl.text,
    );
    // print(
    //     "result = ${XConverter.amountFromBigInt(resultCheckAllowance ?? BigInt.zero, tokenContract!.decimals!)}");
    await XProgressHud.hide();
    update();
  }
}
