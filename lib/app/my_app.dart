import 'dart:async';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ru_app/data/ru_data.dart';

import 'package:ru_app/screens/loading_screen.dart';
import 'package:ru_app/screens/main_screen.dart';
import 'package:ru_app/constants.dart';
import 'package:ru_app/screens/get_all_menu_screen.dart';
import 'package:ru_app/services/firebase_messaging_service.dart';
import 'package:ru_app/services/notification_service.dart';
import 'package:ru_app/screens/historico_do_ru.dart';
import 'package:ru_app/screens/prices.dart';

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
    return ChangeNotifierProvider(
      create: (context) => Data(),
      child: MaterialApp(
        theme: ThemeData.light().copyWith(
          primaryColor: kPrimaryColor,
        ),
        // color: kPrimaryColor,
        initialRoute: LoadingScreen.id,
        routes: {
          LoadingScreen.id: (context) => const LoadingScreen(),
          MainScreen.id: (context) => const MainScreen(),
          TodoCardapioScreen.id: (context) => const TodoCardapioScreen(),
          Prices.id: (context) => const Prices(),
          HistoricoDoRu.id: (context) => const HistoricoDoRu(),
        },
      ),
    );
  }
}
