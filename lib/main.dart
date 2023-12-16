import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_in_app_messaging/firebase_in_app_messaging.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_clean_archticture/core/localization/app_localizations.dart';
import 'package:flutter_clean_archticture/core/localization/localization_service.dart';
import 'package:flutter_clean_archticture/core/localization/supported_locales/locales.dart';
import 'package:flutter_clean_archticture/movies/presentation/home_screen.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'core/services/services_locator.dart';

  void main() {
    initFirebase();
    initServiceLocator();
    runApp(const MyApp());
    configLoading();
    AppLocalizations.setLocale(LocaleTypes.arabic);
  }
void initFirebase () async {
  WidgetsFlutterBinding.ensureInitialized();

  await Firebase.initializeApp().then((value)async {
    FirebaseMessaging.onMessage.listen((RemoteMessage element) {
      print("My Message data is ${element.data}");
      print("My Message data is from ${element.from}");
    });

    FirebaseInAppMessaging firebaseInAppMessaging = FirebaseInAppMessaging.instance;
    FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;
    firebaseInAppMessaging.triggerEvent('testme').then((value) {
      print("we got in app message value.toString()");
    });
    // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);
    String? token = await firebaseMessaging.getToken();
    print("My token is $token");

  });
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
  static _MyAppState? of(BuildContext context) => context.findAncestorStateOfType<_MyAppState>();
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      // routerConfig: GoRouter(
      //   routes: [
      //     GoRoute(
      //       path: '/',
      //       builder: (BuildContext context, GoRouterState state) {
      //         return MyHomePage(title:AppLocalizations.translate(LocaleKeys.hello));//AppLocalizations.of(context)!.hello
      //       },
      //     ),
      //     GoRoute(
      //       path: '/to',
      //       builder: (BuildContext context, GoRouterState state) {
      //         return LoginScreen(title: AppLocalizations.translate(LocaleKeys.hello));
      //       },
      //     ),
      //   ],
      // ),
      // localizationsDelegates: context.localizationDelegates,
      // supportedLocales: AppLocalizations.supportedLocales,
      // supportedLocales: L10n.allLocales,
      //locale: AppLocalizations.locale.value,// LocalizationServices().currentLocale.getCurrentLocalName().key,
      title: 'Flutter Demo',
      home:  ValueListenableBuilder<AppLocale>(
        builder: (BuildContext context, AppLocale value, Widget? child) {
          return MyHomePage(title:AppLocalizations.translate(LocaleKeys.hello));
        },
        valueListenable:LocalizationServices().currentLocale,
        // The child parameter is most helpful if the child is
        // expensive to build and does not depend on the value from
        // the notifier.
        // child: MyHomePage(title:AppLocalizations.translate(LocaleKeys.hello)),
      ),
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      builder: EasyLoading.init(),
    );
  }
}
