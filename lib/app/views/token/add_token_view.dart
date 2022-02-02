import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';

class AddTokenView extends StatelessWidget {
  const AddTokenView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return XLayout(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 5,
            child: Column(
              children: [
                // const TopToken(),
                // const SizedBox(height: kDefaultPadding),
                // const RecentTokens(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
