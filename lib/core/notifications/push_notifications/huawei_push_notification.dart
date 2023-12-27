import 'package:flutter_clean_archticture/core/notifications/notification_data.dart';
import 'package:flutter_clean_archticture/core/notifications/push_notifications/base_push_notification_manager.dart';
import 'package:huawei_push/huawei_push.dart';

class HuaweiNotificationsServices implements BasePushNotificationManager {
  @override
  String getToken() {
    String token = "";
    Push.getTokenStream.listen((value) {
      token = value;
    }, onError: (error) {
      print("TokenErrorEvent: " + error.message);
    });
    return token;
  }

  static void _onMessageReceiveError(Object error) {
    // Called when an error occurs while receiving the data message
  }

  @override
  void init() {
    _handleOnBackgroundORTerminationNotifications();
    _handleOnForegroundNotifications();
    _onNotificationIsClicked();
  }

  @override
  void sendPushNotificationRequest(
      {required NotificationData notificationData}) {
    // TODO: implement sendPushNotificationRequest
  }

  static void _onNotificationIsClicked() {
    Push.onNotificationOpenedApp.listen((value) {});
  }

  static void _handleOnForegroundNotifications() {
    Push.onMessageReceivedStream
        .listen(_handleRemoteMessages, onError: _onMessageReceiveError);
  }

  static void _handleOnBackgroundORTerminationNotifications() async {
    await Push.registerBackgroundMessageHandler(_handleRemoteMessages);
  }

  static void _handleRemoteMessages(RemoteMessage initialMessage) {
    Push.localNotification({
      HMSLocalNotificationAttr.TITLE: '[Headless] DataMessage Received',
      HMSLocalNotificationAttr.MESSAGE: initialMessage.data
    });
  }
}
