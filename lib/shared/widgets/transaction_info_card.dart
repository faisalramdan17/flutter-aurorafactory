import 'package:aurorafactory/core.dart';
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class TransactionInfoCard extends StatelessWidget {
  const TransactionInfoCard({
    Key? key,
    required this.hash,
  }) : super(key: key);

  final String hash;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 10.0),
      child: XNoticeInfo(
        children: [
          SelectableText(
            "Transaction Hash : $hash",
          ),
          const SizedBox(height: 14),
          XActionButton(
            icon: Icons.open_in_new,
            colorIcon: Colors.black,
            backgroundColor: Colors.grey[200],
            label: const Text(
              "Transaction Details in Explorer",
              style: TextStyle(
                color: Colors.black,
              ),
            ),
            onPressed: () {
              launch(ApiString.explorerURL.testnet + "/tx/$hash");
            },
          ),
        ],
      ),
    );
  }
}
