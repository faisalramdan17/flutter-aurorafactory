import 'package:aurorafactory/core.dart';
import 'package:get/get.dart';

abstract class ITokenProvider {
  Future<Response<ResponseToken>> getTokens(String path);
}

class TokenProvider extends GetConnect implements ITokenProvider {
  @override
  void onInit() {
    httpClient.defaultDecoder = ResponseToken.fromMap;
    httpClient.baseUrl = ApiString.explorerURL.testnetAPI;
  }

  @override
  Future<Response<ResponseToken>> getTokens(String path) {
    return get(path);
  }
}
