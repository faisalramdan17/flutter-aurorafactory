class ExplorerURL {
  String mainnet = "https://explorer.mainnet.aurora.dev";
  String testnet = "https://explorer.testnet.aurora.dev";
  String mainnetAPI = "https://explorer.mainnet.aurora.dev/api";
  String testnetAPI = "https://explorer.testnet.aurora.dev/api";
}

class NetworkURL {
  String mainnet = "https://mainnet.aurora.dev";
  String testnet = "https://testnet.aurora.dev";
  String mainnetWS = "wss://mainnet.aurora.dev";
  String testnetWS = "wss://testnet.aurora.dev";
}

class ApiString {
  static ExplorerURL explorerURL = ExplorerURL();
  static NetworkURL networkURL = NetworkURL();
}
