import 'dart:io';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_archticture/core/notifications/notification_data.dart';
import 'package:flutter_clean_archticture/core/notifications/push_notifications/base_push_notification_manager.dart';
import 'package:flutter_clean_archticture/core/notifications/push_notifications/huawei_push_notification.dart';
import 'package:flutter_clean_archticture/core/notifications/push_notifications/firebase_push_notification.dart';
import 'package:flutter_clean_archticture/core/utilities/device_info.dart';

class PushNotificationsServiceProvider {

  static BasePushNotificationManager? _getCurrentPushNotificationService (){

    late BasePushNotificationManager pushNotificationManager;

    if(kIsWeb || Platform.isAndroid || Platform.isIOS || Platform.isMacOS){
      pushNotificationManager = FirebasePushNotificationServices();
    }
    else if(!kIsWeb && Platform.isWindows){
      //no push provided for windows
    }else{
      DeviceInfo.isHuawei().then((value) {
        if(value){
          pushNotificationManager = HuaweiNotificationsServices();
        }
      });
    }
    return pushNotificationManager;
  }

  static void init (){
    _getCurrentPushNotificationService()?.init();
  }

  static void sendPushNotificationRequest(NotificationData notificationData){
    _getCurrentPushNotificationService()?.sendPushNotificationRequest(notificationData: notificationData);
  }
}