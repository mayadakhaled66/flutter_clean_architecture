import 'package:flutter/material.dart';
import 'package:flutter_clean_archticture/movies/presentation/home_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';

import 'core/services/services_locator.dart';

  void main() {
    initServiceLocator();
    runApp(const MyApp());
    configLoading();
  }

  void configLoading() {
    EasyLoading.instance
      ..displayDuration = const Duration(milliseconds: 2000)
      ..indicatorType = EasyLoadingIndicatorType.fadingCircle
      ..loadingStyle = EasyLoadingStyle.dark
      ..indicatorSize = 45.0
      ..radius = 10.0
      ..progressColor = Colors.yellow
      ..backgroundColor = Colors.green
      ..indicatorColor = Colors.yellow
      ..textColor = Colors.yellow
      ..maskColor = Colors.blue.withOpacity(0.5)
      ..userInteractions = true
      ..dismissOnTap = false;
  }

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}


