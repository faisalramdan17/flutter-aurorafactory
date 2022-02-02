// ignore_for_file: constant_identifier_names

import 'package:aurorafactory/app/views/main/main_screen.dart';
import 'package:aurorafactory/core.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  static const INITIAL = Routes.HOME;

  static final routes = [
    GetPage(
      name: Routes.HOME,
      page: () => const MainScreen(),
      binding: MainBinding(),
      // children: [
      // GetPage(
      //   name: Routes.TOKENS,
      //   page: () => CountryView(),
      // ),
      // GetPage(
      //   name: Routes.TOKEN,
      //   page: () => DetailsView(),
      // ),
      // ],
    ),
  ];
}
