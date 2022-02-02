import 'package:aurorafactory/core.dart';
import 'package:fade_shimmer/fade_shimmer.dart';
import 'package:flutter/material.dart';

class FileInfoCard extends StatelessWidget {
  const FileInfoCard({
    Key? key,
    required this.token,
  }) : super(key: key);

  final Token token;

  @override
  Widget build(BuildContext context) {
    Color randomColor = XHelper.generateRandomColor();

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
              XInitialTextIcon(
                text: token.tokenName,
                size: 40,
                color: randomColor,
                colorBackground: randomColor.withOpacity(0.3),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    XConverter.numberSupply(
                        token.tokenSupply, token.tokenDecimal),
                    textAlign: TextAlign.right,
                  ),
                ),
              ),
              Center(
                child: TextButton(
                  style: TextButton.styleFrom(
                    minimumSize: const Size(30, 30),
                  ),
                  onPressed: () {},
                  child: const Icon(Icons.more_vert, color: Colors.white54),
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
              Text(
                "${token.gasUsed} (Gas Used)",
                style: Theme.of(context)
                    .textTheme
                    .caption!
                    .copyWith(color: Colors.white70),
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
    );
  }
}

class ShimmerFileInfoCard extends StatelessWidget {
  const ShimmerFileInfoCard({Key? key}) : super(key: key);

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
              FadeShimmer(
                height: 15,
                width: 70,
                radius: 6,
                highlightColor: kShimmerHighlightColor,
                baseColor: kShimmerBaseColor,
              ),
              FadeShimmer(
                height: 15,
                width: 100,
                radius: 6,
                highlightColor: kShimmerHighlightColor,
                baseColor: kShimmerBaseColor,
              ),
            ],
          )
        ],
      ),
    );
  }
}
