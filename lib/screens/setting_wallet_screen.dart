import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hankest_meta/screens/components/commit_button.dart';

import 'main_screen.dart';

class SettingWalletScreen extends StatefulWidget {
  const SettingWalletScreen({Key? key}) : super(key: key);

  @override
  State<SettingWalletScreen> createState() => _SettingWalletScreenState();
}

class _SettingWalletScreenState extends State<SettingWalletScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
          title: const Text("步驟1"),
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 100,
              ),
              Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.only(left: 10, right: 10),
                child: const Text(
                  "我們將為您創建一個「錢包地址」，這個地址會跟你的手機綁定，錢包地址是Web 3 與 Meta原宇宙最重要的身份識別，請妥善保存喔！",
                ),
              ),
              const SizedBox(
                height: 15,
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: Stack(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(35),
                      decoration: BoxDecoration(
                        color: Theme.of(context).backgroundColor,
                        borderRadius: BorderRadius.circular(10.0),
                        border: Border.all(
                          width: 1,
                          color: Theme.of(context).primaryColor,
                          style: BorderStyle.solid,
                        ),
                      ),
                      child: const Text(
                          "0x5D715C0bDEbbc6929682BaBD0a7Da865b165897D"),
                    ),
                    Positioned(
                      right: 10,
                      bottom: 10,
                      child: GestureDetector(
                        onTap: () {
                          Clipboard.setData(const ClipboardData(
                              text:
                                  "0x5D715C0bDEbbc6929682BaBD0a7Da865b165897D"));
                        },
                        child: Icon(Icons.content_copy,
                            color: Theme.of(context).primaryColor),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 150,
              ),
              CommitButton(
                buttonName: '新手上路',
                width: MediaQuery.of(context).size.width / 3 * 2,
                onTap: () {
                  Navigator.of(context).pushAndRemoveUntil(
                      MaterialPageRoute(
                        builder: (context) => const MainScreen(),
                      ),
                      (route) => false);
                },
              ),
            ],
          ),
        ));
  }
}
