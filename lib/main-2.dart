import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';
import 'package:niku/niku.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) =>
      GetMaterialApp(title: 'Cool ass dapp', home: Home());
}

extension StringE on String {
  NikuText get text => NikuText(this);
}

extension ListE on List<Widget> {
  NikuColumn get column => NikuColumn(this);
  NikuRow get row => NikuRow(this);
  NikuWrap get wrap => NikuWrap(this);
}

class HomeController extends GetxController {
  bool get isEnabled => ethereum != null;

  bool get isInOperatingChain => currentChain == OPERATING_CHAIN;

  bool get isConnected => isEnabled && currentAddress.isNotEmpty;

  String currentAddress = '';

  int currentChain = -1;

  static const OPERATING_CHAIN = 1313161555;

  connect() async {
    if (isEnabled) {
      final accs = await ethereum!.requestAccount();
      if (accs.isNotEmpty) currentAddress = accs.first;

      currentChain = await ethereum!.getChainId();

      update();
    }
  }

  clear() {
    currentAddress = '';
    currentChain = -1;
    cakeToken = null;
    update();
  }

  init() {
    if (isEnabled) {
      ethereum!.onAccountsChanged((accs) {
        clear();
      });

      ethereum!.onChainChanged((chain) {
        clear();
      });
    }
  }

  @override
  void onInit() {
    init();
    print("START");
    super.onInit();
  }

  static const CAKE_ADDRESS = '0xFa1494b6Ced688f836adec40bf2D5Ec2336e96ff';
  // static const CAKE_ADDRESS = '0xF3825Aec101DE2d6f4103Ac2F1a07cfef56b1a4e';
  // static const CAKE_ADDRESS = '0x797F65FEf7f325fe3a508Cb85EBe0BD311DA4654';

  static const DEAD_ADDRESS = '0x351c8b14c381F7724529e2035323132E545C68e8';

  ContractERC20? cakeToken;

  BigInt yourCakeBalance = BigInt.zero;

  getCakeTokenBalance() async {
    if (cakeToken == null) {
      cakeToken = ContractERC20(CAKE_ADDRESS, provider!.getSigner());
    }
    yourCakeBalance = await cakeToken!.balanceOf(currentAddress);
    // Instantiate new `CurrencyParams` object.
    final currency = CurrencyParams(
      name: 'Binance Coin',
      symbol: 'BNB',
      decimals: 18,
    );

    //  await cakeToken!.;
    TransactionResponse a = await cakeToken!.contract.deployTransaction;

    update();
  }

  burnSomeCake() async {
    await getCakeTokenBalance();

    // Burn all 1 gwei of your Cake! Super dangerous!
    if (yourCakeBalance > BigInt.from(10000000000) // 1 Gwei
        ) {
      final tx =
          await cakeToken!.transfer(DEAD_ADDRESS, BigInt.from(10000000000));
      await tx.wait();

      await getCakeTokenBalance();
    }
  }

  final abi = [
    'function name() external view returns (string memory)',
    'function symbol() external view returns (string memory)',
    'function totalSupply() external view returns (uint256)',
  ];

  static const MASTERCHEF_ADDRESS =
      '0xFa1494b6Ced688f836adec40bf2D5Ec2336e96ff';

  Contract? masterChef;

  String tokenName = "";

  String tokenSymbol = "";

  getMasterChefInformation() async {
    if (masterChef == null)
      masterChef = Contract(MASTERCHEF_ADDRESS, abi, provider!.getSigner());
    tokenName = await masterChef!.call<String>('name');
    tokenSymbol = await masterChef!.call<String>('symbol');
    update();
  }

  emergencyWithdraw() async {
    await getMasterChefInformation();

    // EMERGENCY WITHDRAW AT POOL 0; ALERT!
    final tx = await masterChef!.call('totalSupply', [0]);
    await tx.wait();
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (h) => Scaffold(
        body: Center(
          child: [
            Builder(builder: (_) {
              var shown = '';
              if (h.isConnected && h.isInOperatingChain)
                shown = 'You\'re connected!';
              else if (h.isConnected && !h.isInOperatingChain)
                shown = 'Wrong chain! Please connect to BSC.';
              else if (h.isEnabled)
                return NikuButton.outlined(
                  'Connect'.text.bold().fontSize(20),
                ).onPressed(h.connect);
              else
                shown = 'Your browser is not supported!';

              return shown.text.bold().fontSize(20);
            }),
            Niku().height(30),
            if (h.isConnected && h.isInOperatingChain)
              [
                NikuButton('fetch ur cake!'.text.fontSize(20))
                    .onPressed(h.getCakeTokenBalance),
                NikuButton('burn some cake?! (scary)'.text.fontSize(20))
                    .onPressed(h.burnSomeCake),
                'Your cake balance is ${h.yourCakeBalance} wei'
                    .text
                    .fontSize(18)
              ].wrap.spacing(10).crossCenter(),
            if (h.isConnected && h.isInOperatingChain) ...[
              [
                NikuButton('fetch masterchef information!'.text.fontSize(20))
                    .onPressed(h.getMasterChefInformation),
                'Token Name is ${h.tokenName}, '.text.fontSize(18),
                'Symbol is ${h.tokenSymbol}'.text.fontSize(18)
              ].wrap.spacing(10).crossCenter(),
              NikuButton('EMERGENCY WITHDRAW AT POOL 0!!!'.text.fontSize(20))
                  .onPressed(h.burnSomeCake),
            ]
          ].column,
        ),
      ),
    );
  }
}
