import 'package:flutter/material.dart';
import 'package:hankest_meta/screens/welcome_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedIndex = 1;
  WebViewController? webViewController;
  Widget? _child;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  WebView _createWebView(String url) {
    return WebView(
        initialUrl: url,
        javascriptMode: JavascriptMode.unrestricted,
        onWebViewCreated: (controller) {
          webViewController = controller;
        });
  }

  void _onItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
      if (index == 0 || index == 1) {
        var url = "about:blank";
        if (index == 0) {
          url =
              'https://shopee.tw/%E3%80%90Markverse-NFT%E3%80%91-%E5%AE%98%E6%96%B9%E7%99%BD%E5%90%8D%E5%96%AE-i.162008941.13080011822?xptdk=d9ea4987-4e16-49f6-8818-0e6f54088d3d';
        }
        if (index == 1) {
          url =
              'https://nft-web-e71c3.firebaseapp.com/nftBind2?userid=uuid&address=0x5D715C0bDEbbc6929682BaBD0a7Da865b165897D';
        }
        if (webViewController == null) {
          _child = _createWebView(url);
        } else {
          webViewController!.loadUrl(url);
        }
      }

      if (index == 2) {
        webViewController = null;
        _child = Container();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).primaryColor,
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.of(context).pushAndRemoveUntil(
                  MaterialPageRoute(
                    builder: (context) => const WelcomeScreen(),
                  ),
                  (route) => false);
            },
            child: Icon(
              Icons.logout,
              color: Theme.of(context).backgroundColor,
            ),
          ),
        ],
      ),
      body: Center(
        child: _child ??
            WebView(
              initialUrl:
                  "https://nft-web-e71c3.firebaseapp.com/nftBind2?userid=uuid&address=0x5D715C0bDEbbc6929682BaBD0a7Da865b165897D",
              javascriptMode: JavascriptMode.unrestricted,
              onWebViewCreated: (controller) {
                webViewController = controller;
              },
            ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        backgroundColor: Theme.of(context).dialogBackgroundColor,
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.store),
            label: "元宇宙購物",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.account_balance_wallet,
            ),
            label: "我的錢包",
          ),
          BottomNavigationBarItem(
            icon: Icon(
              Icons.engineering,
            ),
            label: "AI 智能客服",
          ),
        ],
        selectedItemColor: Theme.of(context).primaryColor,
        unselectedItemColor: Theme.of(context).primaryColorDark,
        currentIndex: _selectedIndex,
        onTap: _onItemTapped,
      ),
    );
  }
}
