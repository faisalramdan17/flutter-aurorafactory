import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_web3/flutter_web3.dart';
import 'package:get/get.dart';

class Header extends GetView<MenuController> {
  const Header({
    this.isSearchable = true,
    this.isShowTitle = true,
    required this.title,
    Key? key,
  }) : super(key: key);

  final String title;
  final bool isSearchable, isShowTitle;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 17),
      child: Row(
        children: [
          if (!XResponsive.isDesktop(context))
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: IconButton(
                icon: const Icon(
                  Icons.menu,
                  size: 27,
                ),
                onPressed: controller.controlMenu,
              ),
            ),
          if (isShowTitle)
            Text(
              title,
              style: Theme.of(context).textTheme.headline6,
            ),
          if (!XResponsive.isMobile(context))
            Spacer(flex: XResponsive.isDesktop(context) ? 2 : 1),
          if (isSearchable) const Expanded(child: SearchField()),
          const ProfileCard(),
        ],
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetBuilder<FlutterWeb3Controller>(builder: (controller) {
      return Padding(
        padding: const EdgeInsets.only(left: kDefaultPadding),
        child: InkWell(
          onTap: () {
            if (controller.isConnected && !controller.isInOperatingChain) {
              XOpenDialog.info(
                insetPadding: EdgeInsets.symmetric(
                    horizontal: XResponsive.isDesktop(Get.context!) ? 350 : 50),
                title: "Information",
                content:
                    "Wrong chain network, please change to Aurora Testnet Network!",
              );
            } else if (Ethereum.isSupported) {
              controller.connectProvider();
            } else {
              XOpenDialog.info(
                insetPadding: EdgeInsets.symmetric(
                    horizontal: XResponsive.isDesktop(Get.context!) ? 350 : 50),
                title: "Information",
                content:
                    "Your browser is not supported, please install MetaMask extension first!",
              );
            }
          },
          borderRadius: BorderRadius.circular(10),
          child: Container(
              padding: const EdgeInsets.symmetric(
                horizontal: kDefaultPadding,
                vertical: kDefaultPadding / 3,
              ),
              decoration: BoxDecoration(
                color: kSecondaryColor,
                borderRadius: BorderRadius.circular(10),
                border: Border.all(color: Colors.white10),
              ),
              child: Row(
                children: [
                  if (controller.isConnected && controller.isInOperatingChain)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 10, horizontal: 4.0),
                      child: Row(
                        children: [
                          Image.asset(
                            AssetPaths.LOGO + "metamask-logo.png",
                            height: 20,
                          ),
                          if (!XResponsive.isMobile(context))
                            Container(
                              margin: const EdgeInsets.only(left: 10),
                              padding: const EdgeInsets.symmetric(
                                  horizontal: kDefaultPadding / 2),
                              child: Text(XHelper.shortAddress(
                                  controller.currentAddress)),
                            ),
                          // const Icon(Icons.keyboard_arrow_down),
                        ],
                      ),
                    )
                  else if (controller.isConnected &&
                      !controller.isInOperatingChain)
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 11, horizontal: 8.0),
                      child: Text("Wrong Chain Network!"),
                    )
                  else if (Ethereum.isSupported)
                    Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 4.0),
                      child: Row(
                        children: [
                          const Text("Connect to MetaMask"),
                          const SizedBox(width: 12),
                          Image.asset(
                            AssetPaths.LOGO + "metamask-black.png",
                            height: 27,
                          ),
                        ],
                      ),
                    )
                  else
                    const Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 11, horizontal: 8.0),
                      child: Text("Unsupported MetaMask!"),
                    ),
                ],
              )),
        ),
      );
    });
  }
}

class SearchField extends StatelessWidget {
  const SearchField({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return TextField(
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(horizontal: 12),
        hintText: "Search",
        fillColor: kSecondaryColor,
        filled: true,
        border: const OutlineInputBorder(
          borderSide: BorderSide.none,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        suffixIcon: InkWell(
          onTap: () {},
          child: Container(
            padding: const EdgeInsets.all(12),
            margin: const EdgeInsets.symmetric(
              horizontal: kDefaultPadding / 2,
              vertical: kDefaultPadding / 2,
            ),
            decoration: const BoxDecoration(
              color: kPrimaryColor,
              borderRadius: BorderRadius.all(Radius.circular(10)),
            ),
            child: SvgPicture.asset(
              "assets/icons/Search.svg",
            ),
          ),
        ),
      ),
    );
  }
}
