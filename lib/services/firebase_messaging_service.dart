import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:flutter_notification_channel/flutter_notification_channel.dart';
import 'package:flutter_notification_channel/notification_importance.dart';
import 'package:ru_app/services/notification_service.dart';
import 'package:ru_app/networks/network.dart';

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
    // final result =
    await FlutterNotificationChannel.registerNotificationChannel(
      description: 'for notify users',
      id: 'ru_digital',
      importance: NotificationImportance.IMPORTANCE_HIGH,
      name: 'Ru Digital UFPA',
    );
    // print(result);

    NotificationSettings settings =
        await FirebaseMessaging.instance.requestPermission(
      badge: true,
      sound: true,
      alert: true,
      provisional: true,
      //   .setForegroundNotificationPresentationOptions(
      // badge: true,
      // sound: true,
      // alert: true,
    );

    if (settings.authorizationStatus == AuthorizationStatus.authorized) {
    } else if (settings.authorizationStatus ==
        AuthorizationStatus.provisional) {
    } else {}

    getDeviceFirebaseToken();
    _onMessage();
    _onMessageOpenedApp();
    // _onMessageBackground();
  }

  getDeviceFirebaseToken() async {
    final token = await FirebaseMessaging.instance.getToken();
    // print(token);
    NetworkHelper sendPost = NetworkHelper();
    await sendPost.postUserToken(token: token);
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

  // _handleMessage(RemoteMessage message) {
  //   if (message.data['route'] == 'allCardapio') {
  //     Navigator.pushNamed(  TodoCardapioScreen.id,);
  //   }
  // }
  _goToPageAfterMessage(message) {
    // final String route = message.data['route'] ?? '';
    // if (route.isNotEmpty) {
    //   // Routes.h();
    // }
  }

  // _onMessageBackground() {
  // }
}
