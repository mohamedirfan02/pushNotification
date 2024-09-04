import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:messagerdemo/api/firebase_api.dart';
import 'package:messagerdemo/firebase_options.dart';
import 'package:messagerdemo/pages/home_page.dart';
import 'package:messagerdemo/pages/notification.dart';

final navigatorKey = GlobalKey<NavigatorState>();

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(options: DefaultFirebaseOptions.currentPlatform);
  await FirebaseApi().initNotifications();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: const HomePage(),
      navigatorKey: navigatorKey,
      routes: {
        '/notification_screen':(context) =>  const NotificationPage(),
      },
    );
  }
}

