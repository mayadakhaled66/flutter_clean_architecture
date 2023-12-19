import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_clean_archticture/core/notifications/local_notifications_services.dart';
import 'package:flutter_clean_archticture/core/notifications/notifications_services.dart';

import 'notification_data.dart';

class PushNotificationServices {

  static void init() async{
    String? token = await NotificationService.messaging.getToken(
       vapidKey: "BEzhbzJyonipOtOQ0CsDZ0weNmehKZMtpyt_wIH7p0GAo4Y4CBoVmdlOufbv2959fXONpsCNm_FFnwIUpq-vG9o"
    );
    print("Firebase token is $token");
    await NotificationService.messaging.requestPermission();
  }

  static void handleOnForegroundNotifications(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {

      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android!=null) {
        LocalNotificationsServices.showLocalNotification(
          notificationData: NotificationData(
              message.notification!.title??"", message.notification!.body??"", 0, "app news", "app news"),);
      }
    });
  }

  static void handleOnBackgroundNotifications() async {
    FirebaseMessaging.onMessageOpenedApp.listen(_handleRemoteMessages);
  }

  static void handleOnTerminationNotifications() async {
    RemoteMessage? initialMessage = await FirebaseMessaging.instance.getInitialMessage();
    if(initialMessage != null){
      _handleRemoteMessages(initialMessage);
    }
  }

  static void _handleRemoteMessages (RemoteMessage message){
    if (message.data['type'] == 'chat') {
     // NavigatorManger.execute(message.data['type'],message.data['id']);
    }
  }

}