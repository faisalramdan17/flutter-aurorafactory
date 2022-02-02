import 'package:aurorafactory/core.dart';
import 'package:get/get.dart';

class TokenController extends SuperController<ResponseToken> {
  TokenController({required this.tokenRepository});

  final ITokenRepository tokenRepository;

  @override
  void onInit() async {
    super.onInit();

    //Loading, Success, Error handle with 1 line of code
    append(() => tokenRepository.getTokens);
  }

  Token getTokenById(String id) {
    final index = int.tryParse(id);
    if (index != null) {
      return state!.result[index];
    }

    return state!.result.first;
  }

  List<Token> getBigestSupply() {
    List<Token> result = [];
    for (var token in state!.result) {
      result.add(token);
    }
    result.sort((b, a) => a.tokenSupply.compareTo(b.tokenSupply));
    return result;
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
