import 'package:flutter_clean_archticture/core/notifications/local_notifications/base_local_notifications_manager.dart';
import 'package:flutter_clean_archticture/core/notifications/notification_data.dart';
import 'package:local_notifier/local_notifier.dart';

class DesktopLocalNotifications implements BaseLocalNotificationManager{

  @override
  void show({required NotificationData notificationData}) {

    LocalNotification notification = LocalNotification(
      title: notificationData.title,
      body: notificationData.body,
    );
    notification.onShow = _onShowNotification;

    notification.onClose = _onNotificationClose;

    notification.onClick = _handleOnNotificationClick;

    notification.onClickAction = _onActionClick;

    notification.show();
  }

  void _onActionClick(int actionIndex) {
    print('onClickAction - $actionIndex');
  }

  void _handleOnNotificationClick() {
    print('onClick');
  }

  void _onShowNotification() {
    print('onShow');
  }

  void _onNotificationClose(LocalNotificationCloseReason closeReason) {
    // Only supported on windows, other platforms closeReason is always unknown.
    switch (closeReason) {
      case LocalNotificationCloseReason.userCanceled:
      // do something
        break;
      case LocalNotificationCloseReason.timedOut:
      // do something
        break;
      default:
    }
    print('onClose ');
  }


}