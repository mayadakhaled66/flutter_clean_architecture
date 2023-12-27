import 'package:flutter_clean_archticture/core/notifications/local_notifications/base_local_notifications_manager.dart';
import 'package:flutter_clean_archticture/core/notifications/notification_data.dart';
import 'package:universal_html/html.dart';

class WebLocalNotifications implements BaseLocalNotificationManager{

  Future<bool> _checkWebNotificationPermission() async{
    var permission = Notification.permission;
    if (permission != 'granted') {
      permission = await Notification.requestPermission();
    }
    if (permission == 'granted') {
      return true;
    }else{
      return false;
    }
  }

  @override
  void show({required NotificationData notificationData}) async{
    bool isPermissionGranted = await _checkWebNotificationPermission();
    if(isPermissionGranted){
      Notification(notificationData.title,body: notificationData.body);
    }
  }

}