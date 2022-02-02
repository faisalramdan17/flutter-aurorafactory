import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  // await dotenv.load(fileName: ".env");
  // await dotenv.load();
  // String foo = dotenv.get('VAR_NAME');

  // debugPrint("ApiString mainnetURL = ${ApiString.explorerURL.mainnet}");
  // debugPrint("ApiString testnetURL = ${ApiString.networkURL.}");
  // debugPrint("ApiString testnetURL = ${ExplorerURL().testnet}");

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp.router(
      title: 'Aurora ERC20 Factory',
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme:
            GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.white,
        ),
        canvasColor: kSecondaryColor,
      ),
      initialBinding: BindingsBuilder(
        () {
          // Get.put(AuthService());
        },
      ),
      getPages: AppPages.routes,
      debugShowCheckedModeBanner: false,
    );
  }
}