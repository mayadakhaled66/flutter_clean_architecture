import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_clean_archticture/core/notifications/local_notifications/local_notifications_service_provider.dart';
import 'package:flutter_clean_archticture/core/notifications/notification_data.dart';
import 'package:flutter_clean_archticture/core/notifications/notifications_services.dart';
import 'package:flutter_clean_archticture/core/notifications/push_notifications/base_push_notification_manager.dart';


//PLATFORM (ANDROID IOS MACOS WEB)
class FirebasePushNotificationServices implements BasePushNotificationManager{

  @override
  void init() async{
    NotificationSettings settings = await _handleNotificationPermission();
    switch(settings.authorizationStatus){

      case AuthorizationStatus.authorized:
        _handleOnBackgroundNotifications();
        _handleOnForegroundNotifications();
        _handleOnTerminationNotifications();
        break;
      case AuthorizationStatus.denied:
        settings = await _handleNotificationPermission();
        break;
      case AuthorizationStatus.notDetermined:
      // TODO: Handle this case.
        break;
      case AuthorizationStatus.provisional:
      // TODO: Handle this case.
        break;
    }

  }

  Future<NotificationSettings> _handleNotificationPermission ()async{
    NotificationSettings settings = await NotificationService.messaging.requestPermission(
      alert: true,
      announcement: false,
      badge: true,
      carPlay: false,
      criticalAlert: false,
      provisional: false,
      sound: true,
    );
    // await Permission.notification.isDenied.then((value) {
    //   if (value) {
    //     Permission.notification.request();
    //   }
    // });
    print('User granted permission: ${settings.authorizationStatus}');
    return settings;
  }

  String _buildFCMPayload(NotificationData notificationData) {
    return jsonEncode({
      'to': notificationData.token,
      'data': {
        'via': 'FlutterFire Cloud Messaging',
      },
      'notification': {
        'title': 'Title notification - FCM',
        'body': notificationData.body,
      },
    });
  }

  static void _handleOnForegroundNotifications(){
    FirebaseMessaging.onMessage.listen((RemoteMessage message) {
      RemoteNotification? notification = message.notification;
      if (notification != null) {
        LocalNotificationsServiceProvider.show(
           NotificationData(
              message.notification!.title??"", message.notification!.body??"",
               id:0, channelId: "app news",channelName: "app news"),);
      }
    });
  }

  static void _handleOnBackgroundNotifications() async {
    FirebaseMessaging.onMessageOpenedApp.listen(_handleRemoteMessages);
  }

  static void _handleOnTerminationNotifications() async {
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

  @override
  void sendPushNotificationRequest({required NotificationData notificationData}) async{
    try {
      final serverKey = ['Your_SERVER_KEY'];
      await Dio().post(
        Uri.parse('https://fcm.googleapis.com/fcm/send').path,
        options: Options(headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
          'Authorization': 'key=$serverKey'
        },),
        data: _buildFCMPayload(notificationData),
      );
      debugPrint('FCM request for device sent!');
    } catch (e) {
      debugPrint('------ $e ------');
    }
  }

  @override
  Future<String?> getToken() async{
   try {
     String? token = await NotificationService.messaging.getToken(
          vapidKey: "BMrjOL-JOhG2uMDWOVUiJ7czmEXxt9Q9p4weABQHzbAQu2a0pKOCsMwOeAN2vYfN4ZqQ-P8xkMSRObbnV3jHRx4"
      );
     print("Firebase token is $token");
     return token;
   } on Exception catch (e) {
     // TODO
   }
   return null;
  }

}