import 'package:daryaft_flutter/common/styles.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'common/user_defaults.dart';
import 'my_application.dart';
import 'notifications/Push_notifications_manager.dart';
import 'notifications/awsome_notification.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await UserDefaults.getPref();
  await Firebase.initializeApp();

  AppColor(await UserDefaults.getTheme() ?? false);
  // await HiveDb.clearDb();
//  debugRepaintRainbowEnabled = (true);
  AwesomeNotification.initializeNotifications();
  AwesomeNotification.startListing();
  PushNotificationsManager().init();
  runApp(const MyApplication());
}
