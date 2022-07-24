import 'package:flutter/material.dart';
import 'package:the_unknowns/utils/theme.dart';
import 'screens/screens.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: const SplashScreen(),
    );
  }
}
