import 'package:aurorafactory/core.dart';
import 'package:get/get.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(MenuController(), permanent: true);
  }
}
