import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animated_dialog/flutter_animated_dialog.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

import '../dialogs/confirm_dialog.dart';
import '../dialogs/info_dialog.dart';
import 'progress_hub.dart';

class XOpenDialog {
  static const DialogTransitionType animationType = DialogTransitionType.size;

  static Future<void> messageSuccess(String message,
      {String? title, Duration? duration}) async {
    // await ProgressHud.hide();

    Get.snackbar(
      title ?? "Success",
      message,
      backgroundColor: Colors.green[400],
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      borderRadius: 5,
      icon: const Icon(FontAwesomeIcons.checkCircle, color: Colors.white),
      colorText: Colors.white,
      animationDuration: const Duration(milliseconds: 1200),
      duration: duration,
    );
  }

  static Future<void> messageError(String message,
      {String? title, Duration? duration}) async {
    debugPrint("[ERROR] : ${message.toString()}");
    await XProgressHud.hide();

    Get.snackbar(
      title ?? "Error",
      message,
      backgroundColor: Colors.red[400],
      snackPosition: SnackPosition.TOP,
      margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 15),
      borderRadius: 5,
      icon: const Icon(FontAwesomeIcons.exclamationCircle, color: Colors.white),
      colorText: Colors.white,
      animationDuration: const Duration(milliseconds: 1200),
      duration: duration,
    );
  }

  static Future<T?> info<T>({
    String? title,
    String? content,
    String? lottiePath,
    EdgeInsets? lottiePadding,
    String? labelButton,
    Function()? onClicked,
    Widget? customWidget,
    bool isBackAfterYes = true,
    EdgeInsets? insetPadding,
  }) async {
    return await showAnimatedDialog(
      context: Get.context!,
      barrierDismissible: true,
      animationType: animationType,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 500),
      builder: (_) => InfoDialog(
        title: title,
        content: content,
        lottiePath: lottiePath,
        lottiePadding: lottiePadding,
        padding: insetPadding,
        labelButton: labelButton,
        customWidget: customWidget,
        onPressed: () {
          if (isBackAfterYes) Get.back();
          if (onClicked != null) onClicked();
        },
      ),
    );
  }

  static Future<T?> confirm<T>(
      {String? title,
      String? content,
      String? lottiePath,
      String? labelNoButton,
      Function()? onNoClicked,
      String? labelYesButton,
      Function()? onYesClicked,
      Widget? customWidget,
      bool isBackAfterYes = true,
      EdgeInsets? insetPadding}) async {
    // await GetxFire.progressHud.hide();
    return await showAnimatedDialog(
      context: Get.context!,
      barrierDismissible: true,
      animationType: animationType,
      curve: Curves.fastOutSlowIn,
      duration: const Duration(milliseconds: 500),
      builder: (_) => ConfirmDialog(
        title: title,
        content: content,
        insetPadding: insetPadding,
        lottiePath: lottiePath,
        labelLeftButton: labelNoButton,
        customWidget: customWidget,
        onLeftPressed: () {
          Get.back();
          if (onNoClicked != null) onNoClicked();
        },
        labelRightButton: labelYesButton,
        onRightPressed: () {
          if (isBackAfterYes) Get.back();
          if (onYesClicked != null) onYesClicked();
        },
      ),
    );
  }

  static chooseActionIteractionToken(String contractAddress) {
    confirm(
      insetPadding: EdgeInsets.symmetric(
          horizontal: XResponsive.isDesktop(Get.context!) ? 350 : 50),
      title: "Confirmation",
      content: "Please choose one for action:",
      customWidget: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          XActionButton(
            icon: Icons.article,
            backgroundColor: kPrimary2Color,
            label: const Text("Interact with Token Contract"),
            onPressed: () {
              Get.rootDelegate.toNamed(
                  Routes.INTERACT_TOKEN + "?contractAddress=$contractAddress");
              Navigator.pop(Get.context!);
            },
          ),
          XActionButton(
            icon: Icons.open_in_new,
            backgroundColor: kPrimary2Color,
            label: const Text("View Token Contract in Explorer"),
            onPressed: () {
              launch(ApiString.explorerURL.testnet + "/token/$contractAddress");
              Navigator.pop(Get.context!);
            },
          ),
        ],
      ),
    );
  }
}
