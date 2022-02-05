// ignore_for_file: constant_identifier_names

import 'package:aurorafactory/core.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.DASBOARD;

  static final routes = [
    GetPage(
        name: Routes.DASBOARD,
        page: () => const DashboardView(),
        binding: TokenBinding(),
        // participatesInRootNavigator: true,
        // preventDuplicates: true,
        children: [
          GetPage(
            name: Routes.ADD_TOKENS,
            page: () => const AddTokenView(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => AddTokenController());
              Get.lazyPut(() => Web3DartController());
            }),
            bindings: [TokenBinding()],
          ),
          GetPage(
            name: Routes.INTERACT_TOKEN,
            page: () => const InteractTokenView(),
            binding: BindingsBuilder(() {
              Get.lazyPut(() => IntractTokenController());
              // Get.put(IntractTokenController());
            }),
            bindings: [TokenBinding()],
          ),
        ]),
  ];
}
