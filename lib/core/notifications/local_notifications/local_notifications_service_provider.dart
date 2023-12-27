import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter_clean_archticture/core/notifications/local_notifications/desktop_local_notifications.dart';
import 'package:flutter_clean_archticture/core/notifications/local_notifications/base_local_notifications_manager.dart';
import 'package:flutter_clean_archticture/core/notifications/local_notifications/huawei_local_notifications.dart';
import 'package:flutter_clean_archticture/core/notifications/local_notifications/mobile_local_notifications.dart';
import 'package:flutter_clean_archticture/core/notifications/local_notifications/web_local_notifications.dart';
import 'package:flutter_clean_archticture/core/notifications/notification_data.dart';
import 'package:flutter_clean_archticture/core/utilities/device_info.dart';

class LocalNotificationsServiceProvider {

  static BaseLocalNotificationManager? _getCurrentLocalNotification () {

    late BaseLocalNotificationManager? localNotificationManager;

    if(!kIsWeb && (Platform.isAndroid || Platform.isIOS) ){
      localNotificationManager = MobileLocalNotifications();
    }
    else if(kIsWeb){
      localNotificationManager = WebLocalNotifications();
    }
    else if(!kIsWeb &&(Platform.isLinux || Platform.isWindows || Platform.isMacOS)){
      localNotificationManager = DesktopLocalNotifications();
    }else{
      DeviceInfo.isHuawei().then((value) {
        if(value){
          localNotificationManager = HuaweiLocalNotifications();
        }
      });
    }
    return localNotificationManager;
  }

  static void show (NotificationData notificationData)async{
     _getCurrentLocalNotification()?.show(notificationData: notificationData);
  }
}