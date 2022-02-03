import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'components/top_token.dart';
import 'components/recent_tokens.dart';

class DashboardView extends GetView<TokenController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuController.to.scaffoldKey = GlobalKey<ScaffoldState>();
    return XLayout(
      isShowTitle: !XResponsive.isMobile(context),
      title: "Dashboard",
      child: Column(
        children: const [
          TopToken(),
          SizedBox(height: kDefaultPadding),
          RecentTokens(),
        ],
      ),
    );
  }
}
