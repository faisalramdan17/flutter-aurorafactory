import 'package:aurorafactory/core.dart';
import 'package:data_table_2/data_table_2.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:url_launcher/url_launcher.dart';

class RecentTokens extends GetView<TokenController> {
  const RecentTokens({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<DataColumn> columns = const [
      DataColumn(
        label: Center(child: Text("Token Name")),
      ),
      DataColumn(
        label: Center(child: Text("Symbol")),
      ),
      DataColumn(
        label: Center(child: Text("Decimal")),
      ),
      DataColumn(
        label: Center(child: Text("Total Supply")),
      ),
    ];

    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Recent Tokens",
            style: Theme.of(context).textTheme.subtitle1,
          ),
          const SizedBox(height: 4),
          const Divider(),
          SizedBox(
            width: double.infinity,
            child: controller.obx(
              (state) {
                return DataTable2(
                  columnSpacing: kDefaultPadding,
                  minWidth: 600,
                  columns: columns,
                  rows: state!.tokens
                      .map<DataRow>((e) => recentTokenDataRow(e))
                      .toList(),
                );
              },
              onLoading: DataTable2(
                columnSpacing: kDefaultPadding,
                minWidth: 600,
                columns: columns,
                rows: List.generate(8, (index) => shimmerDataRow()),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

DataRow recentTokenDataRow(Token token) {
  return DataRow2(
    onTap: () {
      launch(ApiString.explorerURL.testnet + "/token/${token.contractAddress}");
      //Get.rootDelegate.toNamed('/home/country');
      // Get.rootDelegate
      //     .toNamed('/home/country/details?id=$index');
    },
    cells: [
      DataCell(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            XInitialTextIcon(
              text: token.tokenName,
              fontSize: 12.5,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: Text(token.tokenName ?? "-"),
              ),
            ),
          ],
        ),
      ),
      DataCell(Center(child: Text(token.tokenSymbol ?? "-"))),
      DataCell(Center(child: Text(token.tokenDecimal.toString()))),
      DataCell(Center(
        child: Text(XConverter.numberSupply(token.tokenSupply,
            decimal: token.tokenDecimal)),
      )),
    ],
  );
}

DataRow shimmerDataRow() {
  return DataRow(
    cells: [
      DataCell(
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FadeShimmer(
              height: 30,
              width: 30,
              radius: 6,
              highlightColor: kShimmerHighlightColor,
              baseColor: kShimmerBaseColor,
            ),
            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: kDefaultPadding),
                child: FadeShimmer(
                  height: 20,
                  width: 60,
                  radius: 6,
                  highlightColor: kShimmerHighlightColor,
                  baseColor: kShimmerBaseColor,
                ),
              ),
            ),
          ],
        ),
      ),
      DataCell(
        Center(
          child: FadeShimmer(
            height: 20,
            width: 60,
            radius: 6,
            highlightColor: kShimmerHighlightColor,
            baseColor: kShimmerBaseColor,
          ),
        ),
      ),
      DataCell(
        Center(
          child: FadeShimmer(
            height: 20,
            width: 60,
            radius: 6,
            highlightColor: kShimmerHighlightColor,
            baseColor: kShimmerBaseColor,
          ),
        ),
      ),
      DataCell(
        Center(
          child: FadeShimmer(
            height: 20,
            width: 110,
            radius: 6,
            highlightColor: kShimmerHighlightColor,
            baseColor: kShimmerBaseColor,
          ),
        ),
      ),
    ],
  );
}
