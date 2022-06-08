import 'package:flutter/material.dart';
import 'package:hankest_meta/screens/components/commit_button.dart';
import 'package:hankest_meta/screens/setting_wallet_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SizedBox(
      height: MediaQuery.of(context).size.height,
      width: MediaQuery.of(context).size.width,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Container(
            width: MediaQuery.of(context).size.width / 2,
            decoration: const BoxDecoration(
              boxShadow: [
                BoxShadow(
                  color: Color(0xFFAAAAAA),
                  blurRadius: 5,
                  offset: Offset(1, 4),
                )
              ],
            ),
            child: Image.asset(
              "assets/images/logo.png",
              fit: BoxFit.fill,
            ),
          ),
          const SizedBox(
            height: 60,
          ),
          Text(
            "Hankest Meta",
            style:
                TextStyle(fontSize: 18, color: Theme.of(context).primaryColor),
          ),
          const SizedBox(
            height: 10,
          ),
          const Text(
            "最貼近生活的 NFT 線下賦能平台",
            style: TextStyle(
              fontSize: 14,
            ),
          ),
          const SizedBox(
            height: 40,
          ),
          CommitButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const SettingWalletScreen()),
              );
            },
            buttonName: "馬上開始! ",
            width: MediaQuery.of(context).size.width / 3 * 2,
          ),
        ],
      ),
    ));
  }
}
