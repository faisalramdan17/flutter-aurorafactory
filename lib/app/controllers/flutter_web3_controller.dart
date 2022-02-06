// ignore_for_file: constant_identifier_names

import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';

class FlutterWeb3Controller extends GetxController {
  static FlutterWeb3Controller to = Get.find();
  bool get isInOperatingChain => currentChain == OPERATING_CHAIN;
  bool get isConnected => Ethereum.isSupported && currentAddress.isNotEmpty;
  String currentAddress = '';
  int currentChain = -1;
  bool wcConnected = false;
  static const OPERATING_CHAIN = 1313161555;

  final wc = WalletConnectProvider.fromRpc(
    {OPERATING_CHAIN: ApiString.networkURL.testnet},
    chainId: OPERATING_CHAIN,
    network: 'aurora',
  );

  Web3Provider? web3wc;

  @override
  void onInit() {
    initEthereumProvider();
    super.onInit();
  }

  @override
  void onReady() {
    if (!Ethereum.isSupported) {
      XOpenDialog.info(
        insetPadding: EdgeInsets.symmetric(
            horizontal: XResponsive.isDesktop(Get.context!) ? 350 : 50),
        title: "Information",
        content:
            "Your browser is not supported, please install MetaMask extension first!",
      );
    }
    super.onReady();
  }

  initEthereumProvider() {
    if (Ethereum.isSupported) {
      connectProvider();
      ethereum!.onAccountsChanged((accs) {
        clear();
      });
      ethereum!.onChainChanged((chain) {
        clear();
      });
    }
  }

  clear() {
    currentAddress = '';
    currentChain = -1;
    wcConnected = false;
    web3wc = null;
    update();
  }

  connectProvider() async {
    if (Ethereum.isSupported) {
      final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty) {
        currentAddress = accs.first;
        currentChain = await ethereum!.getChainId();
      }
      update();
    }
  }

  connectWC() async {
    await wc.connect();
    if (wc.connected) {
      currentAddress = wc.accounts.first;
      currentChain = OPERATING_CHAIN;
      wcConnected = true;
      web3wc = Web3Provider.fromWalletConnect(wc);
    }
    update();
  }
}
