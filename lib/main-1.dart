import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';

void main() {
  runApp(const MyApp());
  // Get.put(HomeController());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      GetMaterialApp(title: 'Flutter Web3 Example', home: Home());
}

class HomeController extends GetxController {
  bool get isInOperatingChain => currentChain == OPERATING_CHAIN;

  bool get isConnected => Ethereum.isSupported && currentAddress.isNotEmpty;

  String currentAddress = '';

  int currentChain = -1;

  bool wcConnected = false;

  static const OPERATING_CHAIN = 1313161555;

  // final wc = WalletConnectProvider.binance();
  final wc = WalletConnectProvider.fromRpc(
    {1313161555: 'https://testnet.aurora.dev'},
    chainId: 1313161555,
    network: 'aurora',
  );

  Web3Provider? web3wc;

  @override
  void onInit() {
    init();

    super.onInit();
  }

  init() {
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
      currentChain = 56;
      wcConnected = true;
      web3wc = Web3Provider.fromWalletConnect(wc);
    }

    update();
  }

  getLastestBlock() async {
    print(await provider!.getLastestBlock());
    print(await provider!.getLastestBlockWithTransaction());
  }

  testProvider() async {
    final rpcProvider = JsonRpcProvider('https://mainnet.aurora.dev');
    print(rpcProvider);
    print(await rpcProvider.getNetwork());
  }

  test() async {}

  testSwitchChain() async {
    await ethereum!.walletSwitchChain(1313161555, () async {
      await ethereum!.walletAddChain(
        chainId: 1313161555,
        chainName: 'Aurora Testnet',
        nativeCurrency:
            CurrencyParams(name: 'ETH', symbol: 'ETH', decimals: 18),
        rpcUrls: ['https://testnet.aurora.dev'],
      );
    });
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<HomeController>(
      init: HomeController(),
      builder: (controller) => Scaffold(
        body: Center(
          child: Column(children: [
            Container(height: 10),
            Builder(builder: (_) {
              var shown = '';
              if (controller.isConnected && controller.isInOperatingChain)
                shown = 'You\'re connected!';
              else if (controller.isConnected && !controller.isInOperatingChain)
                shown = 'Wrong chain! Please connect to BSC. (56)';
              else if (Ethereum.isSupported)
                return OutlinedButton(
                    child: Text('Connect'),
                    onPressed: controller.connectProvider);
              else
                shown = 'Your browser is not supported!';

              return Text(shown,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20));
            }),
            Container(height: 30),
            if (controller.isConnected && controller.isInOperatingChain) ...[
              TextButton(
                  onPressed: controller.getLastestBlock,
                  child: Text('get lastest block')),
              Container(height: 10),
              TextButton(
                  onPressed: controller.testProvider,
                  child: Text('test binance rpc provider')),
              Container(height: 10),
              TextButton(onPressed: controller.test, child: Text('test')),
              Container(height: 10),
              TextButton(
                  onPressed: controller.testSwitchChain,
                  child: Text('test switch chain')),
            ],
            Container(height: 30),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text('Wallet Connect connected: ${controller.wcConnected}'),
                Container(width: 10),
                OutlinedButton(
                    child: Text('Connect to WC'),
                    onPressed: controller.connectWC)
              ],
            ),
            Container(height: 30),
            if (controller.wcConnected && controller.wc.connected) ...[
              Text(controller.wc.walletMeta.toString()),
            ],
          ]),
        ),
      ),
    );
  }
}
