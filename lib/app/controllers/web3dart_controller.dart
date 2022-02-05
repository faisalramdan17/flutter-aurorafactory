import 'dart:convert';
import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';
import 'package:web3dart/web3dart.dart';
import 'package:web_socket_channel/io.dart';

class Web3DartController extends GetxController {
  static Web3DartController to = Get.find();
  final String _rpcUrl = ApiString.networkURL.testnet;
  final String _wsUrl = ApiString.networkURL.testnetWS;
  final String _privateKey =
      "59762d63acd51fa11092a2f95b0538c4fc2533b2106813e36c3dcdbb190155df";
  // final String _privateKey =
  //     "977825f588c8ee09aeb059b0099109f913c0fa6dde7f680d51a6fc2801b765db";

  late Web3Client _web3Client;

  @override
  void onInit() {
    initialSetup();
    super.onInit();
  }

  initialSetup() async {
    _web3Client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });
  }

  Future<DeployedContract> getContract() async {
    // abi.json is the contract metadata, you can download it from the remix IDE
    String abi = await rootBundle.loadString("src/artifacts/ERC20Factory.json");
    var jsonAbi = jsonDecode(abi);
    String contractAddress = jsonAbi["networks"]["1313161555"]["address"];
    String contractName = "ERC20Factory";

    DeployedContract contract = DeployedContract(
      ContractAbi.fromJson(jsonEncode(jsonAbi["abi"]), contractName),
      EthereumAddress.fromHex(contractAddress),
    );

    return contract;
  }

  Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
    DeployedContract contract = await getContract();
    ContractFunction function = contract.function(functionName);
    List<dynamic> result = await _web3Client.call(
        contract: contract, function: function, params: args);
    return result;
  }

  Future<String?> transaction(String functionName, List<dynamic> args) async {
    Credentials credential = EthPrivateKey.fromHex(_privateKey);
    DeployedContract contract = await getContract();
    ContractFunction function = contract.function(functionName);
    dynamic result = await _web3Client.sendTransaction(
      credential,
      Transaction.callContract(
        contract: contract,
        function: function,
        parameters: args,
      ),
      fetchChainIdFromNetworkId: true,
      chainId: null,
    );
    return result;
  }
}
