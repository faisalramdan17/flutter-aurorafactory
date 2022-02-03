// To parse this JSON data, do
//
//     final token = tokenFromMap(jsonString);

import 'dart:convert';

class ResponseTokenContract {
  ResponseTokenContract({
    required this.message,
    required this.tokenContract,
    required this.status,
  });

  String message;
  TokenContract tokenContract;
  String status;

  factory ResponseTokenContract.fromJson(String str) =>
      ResponseTokenContract.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory ResponseTokenContract.fromMap(dynamic json) => ResponseTokenContract(
        message: json["message"],
        tokenContract: TokenContract.fromMap(json["result"]),
        status: json["status"],
      );

  Map<String, dynamic> toMap() => {
        "message": message,
        "result": tokenContract.toMap(),
        "status": status,
      };
}

class TokenContract {
  TokenContract({
    this.cataloged,
    required this.contractAddress,
    this.decimals,
    this.name,
    this.symbol,
    this.totalSupply,
    this.type,
  });

  bool? cataloged;
  String contractAddress;
  int? decimals;
  String? name;
  String? symbol;
  double? totalSupply;
  String? type;

  factory TokenContract.fromJson(String str) =>
      TokenContract.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TokenContract.fromMap(Map<String, dynamic> json) => TokenContract(
        cataloged: json["cataloged"],
        contractAddress: json["contractAddress"],
        decimals: int.tryParse(json["decimals"] ?? "0"),
        name: json["name"],
        symbol: json["symbol"],
        totalSupply: double.tryParse(json["totalSupply"] ?? "0"),
        type: json["type"],
      );

  Map<String, dynamic> toMap() => {
        "cataloged": cataloged,
        "contractAddress": contractAddress,
        "decimals": decimals,
        "name": name,
        "symbol": symbol,
        "totalSupply": totalSupply,
        "type": type,
      };
}
