import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SvgPicture.asset(
                      "assets/logo/img.svg",
                      height: 27,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: SvgPicture.asset(
                        "assets/logo/label.svg",
                        color: Colors.white,
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 12, horizontal: 8),
                  child: Text(
                    "ERC20  FACTORY",
                    style: TextStyle(
                      fontSize: 20,
                      fontFamily: GoogleFonts.aBeeZee().fontFamily,
                    ),
                  ),
                ),
              ],
            ),
          ),
          DrawerListTile(
            isSelected:
                ModalRoute.of(context)!.settings.name == Routes.DASBOARD,
            title: "Dashboard",
            svgSrc: "assets/menu/menu_dashbord.svg",
            onPressed: () {
              Get.rootDelegate.toNamed(Routes.DASBOARD);
              //to close the drawer
              Navigator.of(context).pop();
            },
          ),
          DrawerListTile(
            isSelected:
                ModalRoute.of(context)!.settings.name == Routes.INTERACT_TOKEN,
            title: "Interact with Token",
            svgSrc: "assets/menu/menu_tran.svg",
            onPressed: () {
              Get.rootDelegate.toNamed(Routes.INTERACT_TOKEN);
              //to close the drawer
              Navigator.of(context).pop();
            },
          ),
          const Divider(),
          DrawerListTile(
            title: "Open Explorer",
            svgSrc: "assets/menu/menu_doc.svg",
            onPressed: () {
              launch(ApiString.explorerURL.testnet);
            },
          ),
          DrawerListTile(
            title: "Aurora Website",
            svgSrc: "assets/logo/img.svg",
            onPressed: () {
              launch("https://aurora.dev/");
            },
          ),
          DrawerListTile(
            title: "My Youtube",
            svgSrc: "assets/menu/menu_youtube.svg",
            onPressed: () {
              launch(
                  "https://www.youtube.com/CodingYourLife?sub_confirmation=1");
            },
          ),
          DrawerListTile(
            title: "My LinkedIn",
            svgSrc: "assets/menu/menu_linkedin.svg",
            onPressed: () {
              launch("https://www.linkedin.com/in/faisalramdan17");
            },
          ),
          DrawerListTile(
            title: "My Github",
            svgSrc: "assets/menu/menu_github.svg",
            onPressed: () {
              launch("https://www.github.com/faisalramdan17");
            },
          ),
          DrawerListTile(
            title: "My Instagram",
            svgSrc: "assets/menu/menu_ig.svg",
            onPressed: () {
              launch("https://www.instagram.com/faisalramdan17");
            },
          ),
          DrawerListTile(
            title: "Coding Your Life",
            svgSrc: "assets/menu/menu_coding.svg",
            onPressed: () {
              launch("https://www.codingyourlife.id");
            },
          ),
          DrawerListTile(
            title: "Email Me",
            svgSrc: "assets/menu/menu_email.svg",
            onPressed: () {
              String? encodeQueryParameters(Map<String, String> params) {
                return params.entries
                    .map((e) =>
                        '${Uri.encodeComponent(e.key)}=${Uri.encodeComponent(e.value)}')
                    .join('&');
              }

              final Uri emailLaunchUri = Uri(
                scheme: 'mailto',
                path: 'faisalramdan.id@gmail.com',
                query: encodeQueryParameters(<String, String>{
                  'subject': 'I have The Great Opportunity'
                }),
              );

              launch(emailLaunchUri.toString());
            },
          ),
        ],
      ),
    );
  }
}

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    Key? key,
    this.isSelected = false,
    required this.title,
    required this.svgSrc,
    required this.onPressed,
  }) : super(key: key);

  final bool isSelected;
  final String title, svgSrc;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      selected: isSelected,
      selectedTileColor: Colors.white10,
      onTap: onPressed,
      horizontalTitleGap: 0.0,
      leading: SvgPicture.asset(
        svgSrc,
        color: Colors.white54,
        height: 16,
      ),
      title: Text(
        title,
        style: const TextStyle(color: Colors.white54),
      ),
    );
  }
}
