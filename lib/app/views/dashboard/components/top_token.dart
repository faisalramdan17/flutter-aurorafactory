import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'top_token_info_card.dart';

class TopToken extends StatelessWidget {
  const TopToken({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final Size _size = MediaQuery.of(context).size;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Top Bigest Total Supply",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: kDefaultPadding * 1.5,
                  vertical:
                      kDefaultPadding / (XResponsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {
                debugPrint("=== TEST ===");

                //Get.rootDelegate.toNamed('/home/country');
                // Get.rootDelegate
                //     .toNamed('/home/country/details?id=$index');

                // debugPrint(
                //     "DATA = ${Get.find<TokenController>().state!.result.toString()}");
              },
              icon: const Icon(
                Icons.add,
                size: 20,
              ),
              label: const Text("Create New Token Contract"),
            ),
          ],
        ),
        const SizedBox(height: kDefaultPadding),
        XResponsive(
          mobile: TopTokenInfoCardGridView(
            crossAxisCount: _size.width < 650 ? 2 : 4,
            childAspectRatio: _size.width < 650 ? 1.3 : 1,
          ),
          tablet: const TopTokenInfoCardGridView(),
          desktop: TopTokenInfoCardGridView(
            childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
          ),
        ),
      ],
    );
  }
}

class TopTokenInfoCardGridView extends GetView<TokenController> {
  const TopTokenInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return controller.obx(
      (state) {
        List<Token> result = controller.getBigestSupply();
        return GridView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: result.length > 4 ? 4 : result.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: crossAxisCount,
            crossAxisSpacing: kDefaultPadding,
            mainAxisSpacing: kDefaultPadding,
            childAspectRatio: childAspectRatio,
          ),
          itemBuilder: (context, index) =>
              TopTokenInfoCard(token: result[index]),
        );
      },
      onLoading: GridView.builder(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        itemCount: 4,
        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: crossAxisCount,
          crossAxisSpacing: kDefaultPadding,
          mainAxisSpacing: kDefaultPadding,
          childAspectRatio: childAspectRatio,
        ),
        itemBuilder: (context, index) => const ShimmerTopTokenInfoCard(),
      ),
    );
  }
}
