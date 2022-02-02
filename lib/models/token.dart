// To parse this JSON data, do
//
//     final token = tokenFromMap(jsonString);

import 'dart:convert';

class ResponseToken {
  ResponseToken({
    required this.message,
    required this.result,
    required this.status,
  });

  String message;
  List<Token> result;
  String status;

  factory ResponseToken.fromJson(String str) =>
      ResponseToken.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseToken.fromMap(dynamic json) => ResponseToken(
        message: json["message"],
        result: List<Token>.from(json["result"].map((x) => Token.fromMap(x))),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "result": List<dynamic>.from(result.map((x) => x.toMap())),
        "status": status,
      };
}

class Token {
  Token({
    this.tokenName,
    this.tokenSymbol,
    required this.tokenDecimal,
    required this.tokenSupply,
    this.blockHash,
    this.blockNumber,
    this.confirmations,
    this.contractAddress,
    this.cumulativeGasUsed,
    this.from,
    this.gas,
    this.gasPrice,
    this.gasUsed,
    this.hash,
    this.input,
    this.logIndex,
    this.nonce,
    this.timeStamp,
    this.to,
    this.transactionIndex,
  });

  String? tokenName;
  String? tokenSymbol;
  int tokenDecimal;
  double tokenSupply;
  String? blockHash;
  String? blockNumber;
  String? confirmations;
  String? contractAddress;
  String? cumulativeGasUsed;
  String? from;
  String? gas;
  String? gasPrice;
  String? gasUsed;
  String? hash;
  String? input;
  String? logIndex;
  String? nonce;
  String? timeStamp;
  String? to;
  String? transactionIndex;

  factory Token.fromJson(String str) => Token.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Token.fromMap(dynamic json) => Token(
        tokenSupply: double.tryParse(json["value"] ?? "0")!,
        blockHash: json["blockHash"],
        blockNumber: json["blockNumber"],
        confirmations: json["confirmations"],
        contractAddress: json["contractAddress"],
        cumulativeGasUsed: json["cumulativeGasUsed"],
        from: json["from"],
        gas: json["gas"],
        gasPrice: json["gasPrice"],
        gasUsed: json["gasUsed"],
        hash: json["hash"],
        input: json["input"],
        logIndex: json["logIndex"],
        nonce: json["nonce"],
        timeStamp: json["timeStamp"],
        to: json["to"],
        tokenDecimal: int.tryParse(json["tokenDecimal"] ?? "0")!,
        tokenName: json["tokenName"],
        tokenSymbol: json["tokenSymbol"],
        transactionIndex: json["transactionIndex"],
      );

  Map<String, dynamic> toMap() => {
        "value": tokenSupply,
        "blockHash": blockHash,
        "blockNumber": blockNumber,
        "confirmations": confirmations,
        "contractAddress": contractAddress,
        "cumulativeGasUsed": cumulativeGasUsed,
        "from": from,
        "gas": gas,
        "gasPrice": gasPrice,
        "gasUsed": gasUsed,
        "hash": hash,
        "input": input,
        "logIndex": logIndex,
        "nonce": nonce,
        "timeStamp": timeStamp,
        "to": to,
        "tokenDecimal": tokenDecimal,
        "tokenName": tokenName,
        "tokenSymbol": tokenSymbol,
        "transactionIndex": transactionIndex,
      };
}
