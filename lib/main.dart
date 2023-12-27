import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_archticture/core/notifications/push_notifications/push_notifications_service_provider.dart';
import 'package:flutter_clean_archticture/core/utilities/device_info.dart';
import 'package:flutter_clean_archticture/firebase_options.dart';
import 'package:flutter_clean_archticture/movies/presentation/home_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:local_notifier/local_notifier.dart';
import 'core/services/services_locator.dart';

  void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await initNotifications();
    initServiceLocator();
    runApp(const MyApp());
    configLoading();
  }

  Future<void> initNotifications() async {

    await Firebase.initializeApp(
        options: Platform.isWindows ? DefaultFirebaseOptions.android: DefaultFirebaseOptions.currentPlatform);
    if(!kIsWeb && Platform.isWindows){
      await localNotifier.setup(
        appName: 'local_notifier_example',
        shortcutPolicy: ShortcutPolicy.requireCreate,
      );
    }else{
      PushNotificationsServiceProvider.init();
    }


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

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
    @override
  void initState() {
    // TODO: implement initState
    super.initState();

  }
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


