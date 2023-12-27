import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/services.dart';

class DeviceInfo {
  static const MethodChannel methodChannel =
      MethodChannel('com.example.flutter_clean_archticture/isHmsGmsAvailable');

  static Future<bool> isHuawei() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
    print('Running on ${androidInfo.manufacturer}');
    return androidInfo.manufacturer.toLowerCase().contains("google") == false;
  }

  static Future<bool> isHMS() async {
    bool status;

    try {
      bool result = await methodChannel.invokeMethod('isHmsAvailable');
      status = result;
      print('status : ${status.toString()}');
    } on PlatformException {
      print('Failed to get _isHmsAvailable.');
      status = false;
    }

    return status;
  }

  static Future<bool> isGMS() async {
    bool status;

    try {
      bool result = await methodChannel.invokeMethod('isGmsAvailable');
      status = result;
      print('status : ${status.toString()}');
    } on PlatformException {
      print('Failed to get _isGmsAvailable.');
      status = false;
    }

    return status;
  }
}
