import 'package:aurorafactory/core.dart';

abstract class ITokenRepository {
  Future<ResponseToken> getTokens();
}

class TokenRepository implements ITokenRepository {
  TokenRepository({required this.provider});
  final ITokenProvider provider;

  @override
  Future<ResponseToken> getTokens() async {
    final responseToken = await provider.getTokens(
        "?module=account&action=tokentx&address=0x797F65FEf7f325fe3a508Cb85EBe0BD311DA4654");

    // Show token that first created only
    responseToken.body!.result.removeWhere(
        (token) => token.from != "0x0000000000000000000000000000000000000000");

    if (responseToken.status.hasError) {
      return Future.error(responseToken.statusText!);
    } else {
      return responseToken.body!;
    }
  }
}
