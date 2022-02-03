import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'components/header.dart';
import 'components/side_menu.dart';

class XLayout extends GetView<MenuController> {
  const XLayout(
      {required this.title,
      required this.child,
      this.isSearchable = true,
      this.isShowTitle = true,
      Key? key})
      : super(key: key);

  final Widget child;
  final bool isSearchable, isShowTitle;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: controller.scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // We want this side menu only for large screen
            XResponsive.isDesktop(context)
                ?
                // if (screen.isDesktop)
                const Expanded(
                    // default flex = 1
                    // and it takes 1/6 part of the screen
                    child: SideMenu(),
                  )
                : Container(),
            Expanded(
              // It takes 5/6 part of the screen
              flex: 5,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(17),
                child: Column(
                  children: [
                    Header(
                      key: key,
                      title: title,
                      isSearchable: isSearchable,
                      isShowTitle: isShowTitle,
                    ),
                    child,
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
