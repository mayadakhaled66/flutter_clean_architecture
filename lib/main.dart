import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_archticture/movies/presentation/home_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/notifications/push_notification_services.dart';
import 'core/services/services_locator.dart';

  void main() async{
    WidgetsFlutterBinding.ensureInitialized();
    await initNotifications();
    initServiceLocator();
    runApp(const MyApp());
    configLoading();
  }

  Future<void> initNotifications() async {
    await Firebase.initializeApp(options: const FirebaseOptions(
      apiKey: "AIzaSyDzmxbNn1CTDX1JaLfnBboOZlQCrCovtHs",
      appId: "1:497999446278:web:aa15fe09bcbcbc2f1fde87",
      messagingSenderId: "497999446278",
      projectId: "flutter-clean-architectu-9cffc",
    ),);
    PushNotificationServices.init();
    PushNotificationServices.handleOnBackgroundNotifications();
    PushNotificationServices.handleOnForegroundNotifications();
    PushNotificationServices.handleOnTerminationNotifications();
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


