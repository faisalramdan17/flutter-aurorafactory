import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import 'components/top_token.dart';
import 'components/my_tokens.dart';

class DashboardView extends GetView<TokenController> {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    MenuController.to.scaffoldKey = GlobalKey<ScaffoldState>();
    return XLayout(
      isShowTitle: !XResponsive.isMobile(context),
      title: "Dashboard",
      child: GetBuilder<FlutterWeb3Controller>(builder: (controller) {
        return Column(
          children: (controller.isConnected && controller.isInOperatingChain)
              ? [
                  const TopToken(),
                  const SizedBox(height: kDefaultPadding),
                  const MyTokens(),
                ]
              : ((controller.isConnected && !controller.isInOperatingChain)
                  ? [
                      const SizedBox(
                        height: 500,
                        child: Center(
                          child: Text(
                            "Wrong chain network, please change to Aurora Testnet Network!",
                            style: TextStyle(fontSize: 27),
                          ),
                        ),
                      )
                    ]
                  : Ethereum.isSupported
                      ? [
                          const SizedBox(
                            height: 500,
                            child: Center(
                              child: Text(
                                "Please connect to MetaMask extension first!",
                                style: TextStyle(fontSize: 27),
                              ),
                            ),
                          )
                        ]
                      : [
                          const SizedBox(
                            height: 500,
                            child: Center(
                              child: Text(
                                "Your browser is not supported, please install MetaMask extension first!",
                                style: TextStyle(fontSize: 27),
                              ),
                            ),
                          )
                        ]),
        );
      }),
    );
  }
}
