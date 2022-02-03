import 'package:aurorafactory/core.dart';

abstract class ITokenRepository {
  Future<ResponseToken> getTokens();
  Future<ResponseTokenContract> getTokenContract(String contactAddress);
}

class TokenRepository implements ITokenRepository {
  TokenRepository({required this.provider});
  final ITokenProvider provider;

  @override
  Future<ResponseToken> getTokens() async {
    final responseToken = await provider.getTokens(
        "?module=account&action=tokentx&address=0x797F65FEf7f325fe3a508Cb85EBe0BD311DA4654");

    // Show token that first created only
    responseToken.body!.tokens.removeWhere(
        (token) => token.from != "0x0000000000000000000000000000000000000000");

    if (responseToken.status.hasError) {
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
