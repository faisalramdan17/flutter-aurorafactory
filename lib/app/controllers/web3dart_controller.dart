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
      "977825f588c8ee09aeb059b0099109f913c0fa6dde7f680d51a6fc2801b765db";

  late Web3Client _web3Client;
  bool isLoading = true;

  late String _abiCode;
  late EthereumAddress contractAddress;
  late Credentials credentials;
  late DeployedContract deployedContract;
  late ContractFunction _nameFn;
  late ContractFunction _balanceOfFn;
  late ContractFunction _setName;
  late String deployedName;

  @override
  void onInit() {
    initialSetup();
    super.onInit();
  }

  initialSetup() async {
    _web3Client = Web3Client(_rpcUrl, Client(), socketConnector: () {
      return IOWebSocketChannel.connect(_wsUrl).cast<String>();
    });
    // await getAbi();
    // await getCredentials();
    // await getDeployedContract();
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

  // Future<List<dynamic>> query(String functionName, List<dynamic> args) async {
  //   DeployedContract contract = await getContract();
  //   ContractFunction function = contract.function(functionName);
  //   List<dynamic> result = await _web3Client.call(
  //       contract: contract, function: function, params: args);
  //   return result;
  // }

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

  Future<void> getAbi() async {
    // Reading the contract abi
    String abiStringFile =
        await rootBundle.loadString("src/artifacts/ERC20Factory.json");

    var jsonAbi = jsonDecode(abiStringFile);
    _abiCode = jsonEncode(jsonAbi["abi"]);

    print("_contractAddress = ${jsonAbi["networks"]["1313161555"]["address"]}");

    contractAddress =
        EthereumAddress.fromHex(jsonAbi["networks"]["1313161555"]["address"]);
  }

  Future<void> getCredentials() async {
    credentials = EthPrivateKey.fromHex(_privateKey);

    // _contractAddress = await _credentials.extractAddress();
    debugPrint(
        "Address getCredentials() : ${await credentials.extractAddress()}");
  }

  Future<void> getDeployedContract() async {
    // Telling Web3dart where our contract is declared.
    deployedContract = DeployedContract(
        ContractAbi.fromJson(_abiCode, "ERC20Factory"), contractAddress);

    // // Extracting the functions, declared in contract.
    for (var element in deployedContract.functions) {
      print(" FN = ${element.name}");
    }
    // _nameFn = deployedContract.function("name");
    // _balanceOfFn = deployedContract.function("balanceOf");
    // print("_tokenName = ${_tokenName.outputs}");
    // _setName = _contract.function("setName");
    // print("_tokenName = $_tokenName");
    // getName();
  }

  getName() async {
    // Getting the current name declared in the smart contract.
    var currentName = await _web3Client
        .call(contract: deployedContract, function: _nameFn, params: []);
    deployedName = currentName[0];

    var balanceOfFn = await _web3Client.call(
        contract: deployedContract,
        function: _balanceOfFn,
        params: [await credentials.extractAddress()]);

    var getBalance =
        await _web3Client.getBalance(await credentials.extractAddress());

    print("deployedName = $deployedName");
    print("getBalance = ${getBalance.getValueInUnitBI(EtherUnit.ether)}");
    print("balanceOfFn = ${balanceOfFn.first}");
    isLoading = false;
    update();
  }

  setName(String nameToSet) async {
    // Setting the name to nameToSet(name defined by user)
    isLoading = true;
    update();
    await _web3Client.sendTransaction(
        credentials,
        Transaction.callContract(
            contract: deployedContract,
            function: _setName,
            parameters: [nameToSet]));
    getName();
  }
}
