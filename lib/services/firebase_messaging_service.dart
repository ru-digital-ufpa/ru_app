import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:ru_app/services/notification_service.dart';
import 'package:ru_app/data/get_token.dart';

class FirebaseMessagingService {
  final NotificationService _notificationService;

  FirebaseMessagingService(this._notificationService);

  AndroidNotificationDetails androidDetails = const AndroidNotificationDetails(
    'ru_digital',
    'Ru Digital Notificação',
    channelDescription: 'Este canal é para notificação!',
    importance: Importance.max,
    priority: Priority.max,
    enableVibration: true,
  );

  Future<void> initialize() async {
    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      badge: true,
      sound: true,
      alert: true,
      provisional: true,
    );

    // Create the Android notification channel
    const AndroidNotificationChannel channel = AndroidNotificationChannel(
      'ru_digital', // Channel ID (must be unique)
      'Ru Digital UFPA', // Channel name
      description: 'for notify users',
      importance: Importance.high,
    );

    // Initialize flutter_local_notifications plugin
    final FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
        FlutterLocalNotificationsPlugin();

    // Register the channel with flutter_local_notifications
    await flutterLocalNotificationsPlugin
        .resolvePlatformSpecificImplementation<
            AndroidFlutterLocalNotificationsPlugin>()
        ?.createNotificationChannel(channel);

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
      print("Usuário autorizou notificações");
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
      print("Usuário autorizou notificações provisórias");
    } else {
      print("Usuário não autorizou notificações");
    }

    getDeviceFirebaseToken();
    _onMessage();
    _onMessageOpenedApp();
  }

  // ... rest of your code ...
  getDeviceFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    if (token != null) {
      // print("Token: $token");
      GetToken getToken = GetToken();
      getToken.insertToken(token: token);
    }
  }

  _onMessage() async {
    FirebaseMessaging.onMessage.listen((message) {
      RemoteNotification? notification = message.notification;
      AndroidNotification? android = message.notification?.android;

      if (notification != null && android != null) {
        _notificationService.showFirebaseNotification(
            CustomNotification(
              id: android.hashCode,
              title: notification.title!,
              body: notification.body!,
            ),
            NotificationDetails(android: androidDetails));
      }
    });
  }

  _onMessageOpenedApp() async {
    FirebaseMessaging.onMessageOpenedApp.listen(_goToPageAfterMessage);
  }

  _goToPageAfterMessage(message) {
    // Handle navigation logic here based on the received message
  }
}
