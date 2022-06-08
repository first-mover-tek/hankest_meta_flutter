import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hankest_meta/screens/welcome_screen.dart';
import 'package:webview_flutter/webview_flutter.dart';

import 'common/repositories/app_repository.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    if (Platform.isAndroid) {
      WebView.platform = SurfaceAndroidWebView();
    }
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<AppRepository>(
          create: (_) => AppRepository(),
        )
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
          primaryColor: const Color(0xFF00A4B1),
          backgroundColor: const Color(0xFFFFFFFF),
          primaryColorDark: const Color(0xFF000000),
          focusColor: const Color(0xFFC1121A),
          shadowColor: const Color(0xFFAAAAAA),
        ),
        home: const WelcomeScreen(),
      ),
    );
  }
}
