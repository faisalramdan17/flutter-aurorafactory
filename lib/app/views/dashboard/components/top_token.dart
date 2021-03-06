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
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Top Bigest Supply",
              style: Theme.of(context).textTheme.subtitle1,
            ),
            XActionButton(
              label: Text("Create" +
                  ((XResponsive.isDesktop(context)) ? " New Token " : " ") +
                  "Contract"),
              onPressed: () {
                Get.rootDelegate.toNamed(Routes.ADD_TOKENS);
                //to close the drawer
                Navigator.of(context).pop();
              },
              icon: Icons.add,
            ),
          ],
        ),
        const SizedBox(height: kDefaultPadding),
        XResponsive(
          mobile: TopTokenInfoCardGridView(
            crossAxisCount: Get.width < 750 ? 2 : 4,
            childAspectRatio: Get.width < 750 ? 1.3 : 1,
          ),
          tablet: const TopTokenInfoCardGridView(),
          desktop: TopTokenInfoCardGridView(
            childAspectRatio: Get.width < 1400 ? 1.1 : 1.4,
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
        return result.isEmpty
            ? Container()
            : GridView.builder(
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
      onEmpty: Container(),
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
