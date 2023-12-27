import 'dart:io';

import 'package:flutter_clean_archticture/core/notifications/local_notifications/base_local_notifications_manager.dart';
import 'package:flutter_clean_archticture/core/notifications/notification_data.dart';
import 'package:flutter_clean_archticture/core/notifications/notifications_services.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:huawei_push/huawei_push.dart';

class HuaweiLocalNotifications implements  BaseLocalNotificationManager {

  @override
  void show({required NotificationData notificationData}) async {

  bool isEnabled = await _isAndroidNotificationPermissionGranted();
  if(!isEnabled){
    await _requestNotificationPermissions();
  }else{
    Push.localNotification({
      HMSLocalNotificationAttr.TITLE: notificationData.title,
      HMSLocalNotificationAttr.MESSAGE: notificationData.body
    });
  }
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
