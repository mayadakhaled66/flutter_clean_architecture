import 'package:flutter_clean_archticture/core/notifications/notification_data.dart';

abstract class BasePushNotificationManager{
  void init();
  void getToken();
  void sendPushNotificationRequest({required NotificationData notificationData});
}