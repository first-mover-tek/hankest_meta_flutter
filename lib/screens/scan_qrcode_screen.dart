import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:hankest_meta/screens/components/commit_button.dart';
import 'package:scan/scan.dart';

class ScanQrcodeScreen extends StatefulWidget {
  const ScanQrcodeScreen({Key? key}) : super(key: key);

  @override
  State<ScanQrcodeScreen> createState() => _ScanQrcodeScreenState();
}

class _ScanQrcodeScreenState extends State<ScanQrcodeScreen> {
  final _controller = TextEditingController();
  bool _isTap = false;
  final ScanController _scanController = ScanController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).primaryColor,
        ),
        body: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              GestureDetector(
                onTap: () {
                  setState(() {
                    _isTap = true;
                  });
                },
                child: _isTap
                    ? SizedBox(
                        width: 200,
                        height: 200,
                        child: ScanView(
                          controller: _scanController,
                          scanAreaScale: .8,
                          scanLineColor: Theme.of(context).primaryColor,
                          onCapture: (data) async {
                            final json = jsonDecode(data);
                            //TODO 待確認Id拿取方式
                            final roomId = json["roomId"];
                          },
                        ),
                      )
                    : Container(
                        width: MediaQuery.of(context).size.width / 3 * 2,
                        height: 200,
                        color: Theme.of(context).primaryColor,
                        padding: const EdgeInsets.only(left: 10, right: 10),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.qr_code,
                              color: Theme.of(context).backgroundColor,
                              size: 130,
                            ),
                            Text(
                              "掃描QRCode",
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Theme.of(context).backgroundColor),
                            )
                          ],
                        ),
                      ),
              ),
              const SizedBox(
                height: 60,
              ),
              const Text("或者"),
              const SizedBox(
                height: 40,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width / 3 * 2,
                child: TextField(
                  keyboardType: TextInputType.number,
                  controller: _controller,
                  style: TextStyle(
                      fontSize: 16.0, color: Theme.of(context).primaryColor),
                  onChanged: (inputValue) {},
                  decoration: InputDecoration(
                    hintText: "輸入錢包地址",
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    border: InputBorder.none,
                    enabledBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                    focusedBorder: UnderlineInputBorder(
                      borderSide:
                          BorderSide(color: Theme.of(context).primaryColor),
                    ),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              CommitButton(
                buttonName: "進入 Hankest Meta!",
                width: MediaQuery.of(context).size.width / 3 * 2,
                onTap: () {},
              ),
              const SizedBox(
                height: 40,
              ),
            ],
          ),
        ));
  }
}
