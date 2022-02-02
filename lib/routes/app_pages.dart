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
      binding: MainBinding(),
      children: [
        GetPage(
          name: Routes.ADD_TOKENS,
          page: () => const AddTokenView(),
        ),
        // GetPage(
        //   name: Routes.TOKEN,
        //   page: () => DetailsView(),
        // ),
      ],
    ),
  ];
}
