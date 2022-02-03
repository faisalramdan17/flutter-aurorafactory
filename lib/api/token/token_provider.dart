import 'package:aurorafactory/core.dart';
import 'package:get/get.dart';

abstract class ITokenProvider {
  Future<Response<ResponseToken>> getTokens(String path);
  Future<Response<ResponseTokenContract>> getTokenContract(String path);
}

class TokenProvider extends GetConnect implements ITokenProvider {
  @override
  void onInit() {
    httpClient.baseUrl = ApiString.explorerURL.testnetAPI;
  }

  @override
  Future<Response<ResponseToken>> getTokens(String path) {
    return get(path, decoder: ResponseToken.fromMap);
  }

  @override
  Future<Response<ResponseTokenContract>> getTokenContract(String path) {
    return get(path, decoder: ResponseTokenContract.fromMap);
  }
}
