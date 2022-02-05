import 'package:aurorafactory/core.dart';
import 'package:flutter/foundation.dart';

abstract class ITokenRepository {
  Future<ResponseToken> getTokens(String accountAddress);
  Future<ResponseTokenContract> getTokenContract(String contactAddress);
}

class TokenRepository implements ITokenRepository {
  TokenRepository({required this.provider});
  final ITokenProvider provider;

  @override
  Future<ResponseToken> getTokens(String accountAddress) async {
    final responseToken = await provider
        .getTokens("?module=account&action=tokentx&address=$accountAddress");

    // Show token that first created only
    responseToken.body!.tokens.removeWhere((token) {
      bool condition1 =
          token.from != "0x0000000000000000000000000000000000000000";
      return condition1;
      // bool condition2 = token.tokenName == "" || token.tokenName == null;
      // bool condition3 = token.tokenSymbol == "" || token.tokenSymbol == null;
      // bool condition4 = token.tokenDecimal == 0;
      // bool condition5 = token.tokenSupply == 0;
      // return condition1 || condition2 || condition3 || condition4 || condition5;
    });

    if (responseToken.status.hasError) {
      debugPrint("ERROR = ${responseToken.statusText!}");
      return Future.error(responseToken.statusText!);
    } else {
      return responseToken.body!;
    }
  }

  @override
  Future<ResponseTokenContract> getTokenContract(String contactAddress) async {
    final responseToken = await provider.getTokenContract(
        "?module=token&action=getToken&contractaddress=$contactAddress");

    if (responseToken.status.hasError) {
      return Future.error(responseToken.statusText!);
    } else {
      return responseToken.body!;
    }
  }
}
