import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'package:the_unknowns/utils/theme.dart';
import 'screens/screens.dart';

Future main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: Apptheme.light(),
      darkTheme: Apptheme.dark(),
      home: const ChatScreen(),
    );
  }
}
