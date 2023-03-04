import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:ru_app/screens/loading_screen.dart';
import 'package:ru_app/screens/main_screen.dart';
import 'package:ru_app/constants.dart';
import 'package:ru_app/screens/todo_cardapio_screen.dart';
import 'package:ru_app/services/firebase_messaging_service.dart';
import 'package:ru_app/services/notification_service.dart';

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(minutes: 30),
      (timer) {
        Provider.of<FirebaseMessagingService>(context, listen: false)
            .getDeviceFirebaseToken();
      },
    );
    initializeFirebaseMessaging();
    checkNotifications();
  }

  initializeFirebaseMessaging() async {
    await Provider.of<FirebaseMessagingService>(context, listen: false)
        .initialize();
  }

  checkNotifications() async {
    await Provider.of<NotificationService>(context, listen: false)
        .checkForNotifications();
  }

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.light().copyWith(
        primaryColor: kPrimaryColor,
        useMaterial3: true,
      ),
      color: kPrimaryColor,
      initialRoute: LoadingScreen.id,
      routes: {
        LoadingScreen.id: (context) => const LoadingScreen(),
        MainScreen.id: (context) => MainScreen(),
        TodoCardapioScreen.id: (context) => const TodoCardapioScreen(),
      },
    );
  }
}
