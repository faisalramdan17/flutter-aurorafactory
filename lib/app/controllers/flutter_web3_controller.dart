import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';

class FlutterWeb3Controller extends GetxController {
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
