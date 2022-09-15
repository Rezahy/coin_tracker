import './screens/splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData.dark().copyWith(
          // primaryColor: Colors.lightBlue,
          textTheme: const TextTheme(
              bodyText1: TextStyle(fontFamily: 'OpenSans'),
              bodyText2: TextStyle(fontFamily: 'OpenSans')),
          colorScheme: ColorScheme.fromSwatch(accentColor: Colors.grey),
          appBarTheme: const AppBarTheme(
              titleTextStyle: TextStyle(
                  fontFamily: 'OpenSans',
                  fontWeight: FontWeight.w600,
                  fontSize: 20),
              backgroundColor: Colors.black),
          scaffoldBackgroundColor: const Color(0xFF474647)),
      title: 'Coin Tracker',
      home: const SplashScreen(),
    );
  }
}
