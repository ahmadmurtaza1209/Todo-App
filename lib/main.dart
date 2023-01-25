import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:page_transition/page_transition.dart';

import 'package:todo_app/screens/date_screen.dart';
import 'package:todo_app/screens/home_screen.dart';

import 'config/object_box.dart';

late final ObjectBox objectBox;
Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  objectBox = await ObjectBox.init();
  runApp(const MyApp());
}

// command
// flutter pub run build_runner build
// flutter pub run build_runner build --delete-conflicting-outputs
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: AnimatedSplashScreen(
          animationDuration: Duration(seconds: 3),
          splashIconSize: 150.0,
          splash: "Assets/images/splash.png",
          nextScreen: HomeScreen(),
          curve: Curves.easeInCirc,
          splashTransition: SplashTransition.fadeTransition,
          pageTransitionType: PageTransitionType.rightToLeft,
          backgroundColor: Colors.white,
        ));
  }
}
