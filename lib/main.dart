import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

void main() async {
  // await dotenv.load(fileName: ".env");
  // await dotenv.load();
  // String foo = dotenv.get('VAR_NAME');

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
        primaryColor: kPrimaryColor,
        primaryColorDark: kPrimaryColor,
        primaryColorLight: kPrimaryColor,
        buttonTheme: const ButtonThemeData().copyWith(
          buttonColor: kPrimaryColor,
        ),
        scaffoldBackgroundColor: kBackgroundColor,
        textTheme:
            GoogleFonts.poppinsTextTheme(Theme.of(context).textTheme).apply(
          bodyColor: Colors.white,
        ),
        canvasColor: kSecondaryColor,
      ),
      getPages: AppPages.routes,
      initialBinding: InitialBinding(),
      defaultTransition: Transition.fadeIn,
      transitionDuration: const Duration(milliseconds: 500),
      debugShowCheckedModeBanner: false,
    );
  }
}
