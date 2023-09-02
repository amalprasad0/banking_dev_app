import 'package:device_info/device_info.dart';
import 'package:flutter/material.dart';

class UserFunctions {
  final DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
  String? deviceId;

  Future<String?> getDeviceId(BuildContext context, {required BuildContext BuildContext}) async {
    try {
      if (Theme.of(context).platform == TargetPlatform.iOS) {
        final IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
        deviceId = iosInfo.identifierForVendor; // iOS device ID
      } else {
        final AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
        deviceId = androidInfo.androidId;
      }
    } catch (e) {
      print("Error getting device ID: $e");
    }
    return deviceId;
  }
}
