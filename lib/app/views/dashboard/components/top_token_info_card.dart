import 'package:aurorafactory/core.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TopTokenInfoCard extends StatelessWidget {
  const TopTokenInfoCard({
    Key? key,
    required this.token,
  }) : super(key: key);

  final Token token;

  @override
  Widget build(BuildContext context) {
    Color randomColor = XHelper.generateRandomColor();

    return InkWell(
      onTap: () =>
          XOpenDialog.chooseActionIteractionToken(token.contractAddress!),
      child: Container(
        padding: const EdgeInsets.all(kDefaultPadding),
        decoration: const BoxDecoration(
          color: kSecondaryColor,
          borderRadius: BorderRadius.all(Radius.circular(10)),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                XInitialTextIcon(
                  text: token.tokenName,
                  size: XResponsive.isDesktop(context) ? 40 : 35,
                  color: randomColor,
                  colorBackground: randomColor.withOpacity(0.3),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Text(
                      XConverter.numberSupply(token.tokenSupply,
                              decimal: token.tokenDecimal,
                              isAbbreviation: true) +
                          (token.tokenSymbol == null
                              ? ""
                              : "  (${token.tokenSymbol})"),
                      textAlign: TextAlign.right,
                    ),
                  ),
                ),
                InkWell(
                  onTap: () => launch(ApiString.explorerURL.testnet +
                      "/token/${token.contractAddress}"),
                  child: const Icon(
                    Icons.open_in_new,
                    color: Colors.blue,
                    size: 20,
                  ),
                )
              ],
            ),
            Text(
              token.tokenName ?? "-",
              maxLines: 1,
              overflow: TextOverflow.ellipsis,
            ),
            XProgressLine(
              color: randomColor,
              percentage: 70,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                  child: Text(
                    "${token.gasUsed}" +
                        (XResponsive.isDesktop(context) ? " (Gas Used)" : ""),
                    style: Theme.of(context)
                        .textTheme
                        .caption!
                        .copyWith(color: Colors.white70),
                  ),
                ),
                Text(
                  token.gas!,
                  style: Theme.of(context)
                      .textTheme
                      .caption!
                      .copyWith(color: Colors.white),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class ShimmerTopTokenInfoCard extends StatelessWidget {
  const ShimmerTopTokenInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(kDefaultPadding),
      decoration: const BoxDecoration(
        color: kSecondaryColor,
        borderRadius: BorderRadius.all(Radius.circular(10)),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Row(
            children: [
              FadeShimmer(
                height: 40,
                width: 40,
                radius: 6,
                highlightColor: kShimmerHighlightColor,
                baseColor: kShimmerBaseColor,
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: FadeShimmer(
                    height: 20,
                    width: 60,
                    radius: 6,
                    highlightColor: kShimmerHighlightColor,
                    baseColor: kShimmerBaseColor,
                  ),
                ),
              ),
              FadeShimmer(
                height: 20,
                width: 20,
                radius: 6,
                highlightColor: kShimmerHighlightColor,
                baseColor: kShimmerBaseColor,
              ),
            ],
          ),
          FadeShimmer(
            height: 20,
            width: 150,
            radius: 6,
            highlightColor: kShimmerHighlightColor,
            baseColor: kShimmerBaseColor,
          ),
          FadeShimmer(
            height: 5,
            width: double.infinity,
            radius: 10,
            highlightColor: kShimmerHighlightColor,
            baseColor: kShimmerBaseColor,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: FadeShimmer(
                  height: 15,
                  width: 60,
                  radius: 6,
                  highlightColor: kShimmerHighlightColor,
                  baseColor: kShimmerBaseColor,
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: FadeShimmer(
                    height: 15,
                    width: 90,
                    radius: 6,
                    highlightColor: kShimmerHighlightColor,
                    baseColor: kShimmerBaseColor,
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
