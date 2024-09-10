import 'package:flutter_local_notifications/flutter_local_notifications.dart';

class FlutterLocalNotification{

  static Future initialize(FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin)async{
    var androidInitialize = const AndroidInitializationSettings("mipmap/logo");
    var iOSInitialize = const DarwinInitializationSettings();
    var initializationSettings = InitializationSettings(
      android: androidInitialize,
      iOS: iOSInitialize
    );
    await flutterLocalNotificationsPlugin.initialize(initializationSettings);
  }

  static Future showBigTextNotification({
    var id = 0,
    required String title,
    required String body,
    var playLoad,
    required FlutterLocalNotificationsPlugin fln
  })async{

    AndroidNotificationDetails androidPlatformChannelSpecifics =
    const AndroidNotificationDetails(
        "channelId",
        "channelName",
      playSound: true,
      importance: Importance.max,
      priority: Priority.high,
      icon: "mipmap/logo",
    );

    var notification = NotificationDetails(
      android: androidPlatformChannelSpecifics,
      iOS: const DarwinNotificationDetails()
    );

    await fln.show(0, title, body, notification);

  }

}