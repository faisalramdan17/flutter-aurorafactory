import 'package:aurorafactory/core.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';

class TokenController extends SuperController<ResponseToken> {
  TokenController({required this.tokenRepository});
  static TokenController to = Get.find();
  ITokenRepository tokenRepository;

  @override
  void onInit() async {
    super.onInit();

    //Loading, Success, Error handle with 1 line of code
    append(() => getTokens);
  }

  Future<ResponseToken> getTokens() async {
    return tokenRepository.getTokens(await provider!.getSigner().getAddress());
  }

  List<Token> getBigestSupply() {
    List<Token> result = [];
    for (var token in state!.tokens) {
      result.add(token);
    }
    result.sort((b, a) => a.tokenSupply.compareTo(b.tokenSupply));
    return result;
  }

  @override
  void onClose() {
    super.onClose();
  }

  @override
  void onDetached() {
    // Implement onDetached
  }

  @override
  void onInactive() {
    // Implement onInactive
  }

  @override
  void onPaused() {
    // Implement onPaused
  }

  @override
  void onResumed() {
    // Implement onResumed
  }
}
