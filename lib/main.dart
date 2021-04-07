import 'dart:io';

import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:flutter_local_notifications/flutter_local_notifications.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'Screens/Home_pages_screens/Home_pages_screen.dart';
import 'Screens/Login_screens/Login_screen.dart';
import 'app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  prefs = await SharedPreferences.getInstance();
  runApp(MyApp());
}

String userToken;

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
    firebaseCloudMessaging_Listeners();
  }

  @override
  Widget build(BuildContext context) {
    print(firebaseAuth.currentUser);
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Osrah Station Family",
      theme: ThemeData(
        primaryColor: Color(0xFFEE1939),
        backgroundColor: Color(0xFFF7F6FC),
        iconTheme: IconThemeData(
          color: Color(0xFFEE1939),
        ),
        fontFamily: "URW-DIN-Arabic",
      ),
      home: firebaseAuth.currentUser != null
          ? Home_pages_screen()
          : Login_screen(),
    );
  }
}

FlutterLocalNotificationsPlugin flutterLocalNotificationsPlugin =
    new FlutterLocalNotificationsPlugin();
final FirebaseMessaging firebaseMessaging = FirebaseMessaging.instance;

Future<void> firebaseCloudMessaging_Listeners() async {
  var android = new AndroidInitializationSettings('app_icon'); //app_icon
  final IOSInitializationSettings initializationSettingsIOS =
      IOSInitializationSettings();
  var platform = new InitializationSettings(
      android: android, iOS: initializationSettingsIOS);
  flutterLocalNotificationsPlugin.initialize(platform).then((value) {
    print("is reciver notification");
    // firebaseMessaging.configure(
    //   onMessage: (Map<String, dynamic> message) async {
    //     print('on message  ');
    //     print(message);
    //     showNotification(message);
    //   },
    //   onResume: (Map<String, dynamic> message) async {
    //     print('on resume ');
    //     print(message);
    //     showNotification(message);
    //   },
    //   onLaunch: (Map<String, dynamic> message) async {
    //     print('on launch ');
    //     print(message);
    //     showNotification(message);
    //   },
    // );
  });

  if (Platform.isIOS) iOS_Permission();
  firebaseMessaging.getToken().then((token) {
    userToken = token;
    print("token $token");
  });

  if (firebaseAuth.currentUser != null &&
      firebaseAuth.currentUser.uid != null) {
    String familyId = await familiesService.getFamilyId();
    await familiesService.updateLoginDate(familyId);
  }
}

void iOS_Permission() {
  firebaseMessaging.requestPermission(sound: true, badge: true, alert: true);
  // firebaseMessaging..onIosSettingsRegistered
  //     .listen((IosNotificationSettings settings) {
  //   print("Settings registered: $settings");
  // });
}

showNotification(Map<String, dynamic> msg) async {
  var android = new AndroidNotificationDetails(
    'sdffds dsffds',
    "CHANNLE NAME",
    "channelDescription",
  );
  var iOS = new IOSNotificationDetails();
  var platform = new NotificationDetails(android: android, iOS: iOS);
  if (Platform.isIOS) {
    await flutterLocalNotificationsPlugin.show(
        0, msg['notification']['title'], msg['notification']['body'], platform);
  } else {
    await flutterLocalNotificationsPlugin.show(
        0, msg['notification']['title'], msg['notification']['body'], platform);
  }
}
