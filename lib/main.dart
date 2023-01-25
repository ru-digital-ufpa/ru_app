import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:ru_app/screens/loading_screen.dart';
import 'package:ru_app/screens/main_screen.dart';
import 'package:ru_app/constants.dart';
import 'package:provider/provider.dart';
import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/screens/todo_cardapio_screen.dart';
import 'package:ru_app/services/firebase_messaging_service.dart';
import 'package:ru_app/services/notification_service.dart';

@pragma('vm:entry-point')
Future<void> _firebaseMessagingBackgroundHandler(RemoteMessage message) async {
  // print("Handling a background message");
  await Firebase.initializeApp();
}

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  // FirebaseMessaging.onBackgroundMessage(_firebaseMessagingBackgroundHandler);

  runApp(
    MultiProvider(
      providers: [
        Provider<NotificationService>(
            create: (context) => NotificationService()),
        Provider<FirebaseMessagingService>(
            create: (context) =>
                FirebaseMessagingService(context.read<NotificationService>())),
      ],
      child: ChangeNotifierProvider(
        create: (_) => Data(),
        child: const MyApp(),
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({super.key});

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
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
        LoadingScreen.id: (context) => LoadingScreen(),
        MainScreen.id: (context) => MainScreen(),
        TodoCardapioScreen.id: (context) => const TodoCardapioScreen(),
      },
    );
  }
}
