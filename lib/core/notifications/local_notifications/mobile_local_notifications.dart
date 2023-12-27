import 'dart:io';
import 'package:flutter_clean_archticture/core/notifications/local_notifications/base_local_notifications_manager.dart';
import 'package:flutter_clean_archticture/core/notifications/notification_data.dart';
import 'package:flutter_clean_archticture/core/notifications/notifications_services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';


class MobileLocalNotifications implements  BaseLocalNotificationManager {

  @override
  void show({required NotificationData notificationData}) async {

  NotificationDetails platformChannelSpecifics =
        _initNotificationDetails(notificationData.channelId??"",notificationData.channelName??"");

  bool isEnabled = await _isAndroidNotificationPermissionGranted();
  if(!isEnabled){
    await _requestNotificationPermissions();
  }else{
    NotificationService.flutterLocalNotificationsPlugin.show(
        notificationData.id??0,
        notificationData.title,
        notificationData.body,
        platformChannelSpecifics
    );
  }
}

  static NotificationDetails _initNotificationDetails(String channelId, String channelName,{List<AndroidNotificationAction>? actions}) {
    AndroidNotificationDetails androidNotificationDetails =  AndroidNotificationDetails(
        channelId, channelName,icon: "app_icon",
        channelDescription: "",
        importance: Importance.high,
        priority: Priority.high,
        actions: actions);

    DarwinNotificationDetails darwinNotificationDetails = const DarwinNotificationDetails(
        presentAlert: true,presentSound: true,presentBadge: true,presentBanner: true,
        presentList: true,interruptionLevel: InterruptionLevel.active);

    LinuxNotificationDetails linuxNotificationDetails = const LinuxNotificationDetails();

        NotificationDetails notificationDetails = NotificationDetails(android: androidNotificationDetails,
       iOS: darwinNotificationDetails, linux: linuxNotificationDetails);

        return notificationDetails;
  }

  static void cancelNotificationById (int id)async{
    await NotificationService.flutterLocalNotificationsPlugin.cancel(id);
  }

  static void cancelAllNotifications ()async{
    await NotificationService.flutterLocalNotificationsPlugin.cancelAll();
  }

  static Future<bool> _isAndroidNotificationPermissionGranted() async {
    if (Platform.isAndroid) {
      final bool granted = await NotificationService.flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>()
          ?.areNotificationsEnabled() ??
          false;

     return granted;
    }
    return false;
  }

  static Future<void> _requestNotificationPermissions() async {
    if (Platform.isIOS || Platform.isMacOS) {
      await NotificationService.flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<IOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
      await NotificationService.flutterLocalNotificationsPlugin
          .resolvePlatformSpecificImplementation<MacOSFlutterLocalNotificationsPlugin>()
          ?.requestPermissions(
        alert: true,
        badge: true,
        sound: true,
      );
    } else if (Platform.isAndroid) {

      final AndroidFlutterLocalNotificationsPlugin? androidImplementation =
      NotificationService.flutterLocalNotificationsPlugin.resolvePlatformSpecificImplementation<AndroidFlutterLocalNotificationsPlugin>();

      await androidImplementation?.requestNotificationsPermission();
    }
  }
  }