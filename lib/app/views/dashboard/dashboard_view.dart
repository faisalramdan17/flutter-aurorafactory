import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'components/top_token.dart';
import 'components/recent_tokens.dart';

class DashboardView extends StatelessWidget {
  const DashboardView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XLayout(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: const [
                TopToken(),
                SizedBox(height: kDefaultPadding),
                RecentTokens(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
