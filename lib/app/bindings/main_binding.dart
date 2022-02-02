import 'package:aurorafactory/core.dart';
import 'package:get/get.dart';

class MainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ITokenProvider>(() => TokenProvider());
    Get.lazyPut<ITokenRepository>(() => TokenRepository(provider: Get.find()));
    Get.lazyPut(() => TokenController(tokenRepository: Get.find()));
    Get.put(MenuController());
  }
}
