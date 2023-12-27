import 'package:flutter_clean_archticture/core/notifications/notification_data.dart';

abstract class BaseLocalNotificationManager {
  void show ({required NotificationData notificationData});
}