import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'components/header.dart';
import 'components/top_token.dart';
import 'components/recent_tokens.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(kDefaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(height: kDefaultPadding + 4),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const TopToken(),
                      const SizedBox(height: kDefaultPadding),
                      const RecentTokens(),
                      if (XResponsive.isMobile(context))
                        const SizedBox(height: kDefaultPadding),
                    ],
                  ),
                ),
                if (!XResponsive.isMobile(context))
                  const SizedBox(width: kDefaultPadding),
              ],
            )
          ],
        ),
      ),
    );
  }
}
