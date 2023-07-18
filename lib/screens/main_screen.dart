import 'dart:async';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:ru_app/constants.dart';
import 'package:ru_app/drawer/ru_drawer.dart';
// import 'package:ru_app/services/firebase_messaging_service.dart';
// import 'package:ru_app/services/notification_service.dart';
import 'package:ru_app/widgets/ru_list_view.dart';
import 'package:ru_app/data/ru_data.dart';
import 'package:ru_app/permission/notification_permission.dart';

class MainScreen extends StatefulWidget {
  static String id = 'main_screen';

  const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  RuNotificationsPermissions getPermission = RuNotificationsPermissions();

  @override
  void initState() {
    super.initState();
    Timer.periodic(
      const Duration(minutes: 15),
      (timer) {
        Provider.of<Data>(context, listen: false).onTimer();
        // Provider.of<FirebaseMessagingService>(context, listen: false)
        //     .getDeviceFirebaseToken();
        Provider.of<Data>(context, listen: false).getNewsFromServer();
      },
    );
    getUerPermissions();
  }

  getUerPermissions() async {
    bool isPermit = await getPermission.notificationPermission();
    if (!isPermit) {
      // ignore: use_build_context_synchronously
      //   Provider.of<NotificationService>(context, listen: false)
      //       .showLocalNotification(
      //           CustomNotification(id: 1, title: 'Oi', body: 'Acesse o app!'));
    }
  }

  List<dynamic> updateCardapioDoDia = [];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kPrimaryColor,
        iconTheme: const IconThemeData(
          color: kSecondaryColor,
        ),
        title: const Text(
          'RU DIGITAL',
          style: TextStyle(
            color: kSecondaryColor,
            fontSize: 20.0,
            fontWeight: FontWeight.w900,
          ),
        ),
        actions: <Widget>[
          Padding(
            padding: const EdgeInsets.only(
              right: 5,
            ),
            child: CircleAvatar(
              radius: 24,
              backgroundColor: kSecondaryColor,
              child: Padding(
                padding: const EdgeInsets.all(3.5),
                child: Image.asset(
                  'images/ufpa_logo.png',
                  fit: BoxFit.fitWidth,
                ),
              ),
            ),
          ),
        ],
      ),
      body: const SafeArea(
        child: RuListView(),
      ),
      drawer: const RuDrawer(),
    );
  }
}
