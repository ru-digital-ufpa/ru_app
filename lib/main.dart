import 'dart:async';

import 'package:flutter/material.dart';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'firebase_options.dart';
import 'package:provider/provider.dart';

import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/services/firebase_messaging_service.dart';
import 'package:ru_app/services/notification_service.dart';
import 'package:ru_app/my_app.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // print("Handling a background message");
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    MultiProvider(
      providers: [
        Provider<NotificationService>(
            create: (context) => NotificationService()),
        Provider<FirebaseMessagingService>(
          create: (context) => FirebaseMessagingService(
            context.read<NotificationService>(),
          ),
        ),
      ],
      child: ChangeNotifierProvider(
        create: (_) => Data(),
        child: const MyApp(),
      ),
    ),
  );
}
