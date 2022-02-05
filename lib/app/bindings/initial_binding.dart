import 'package:aurorafactory/core.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MenuController(), permanent: true);
    // Get.put(Web3DartController(), permanent: true);
    // Get.put(FlutterWeb3Controller(), permanent: true);
  }
}
