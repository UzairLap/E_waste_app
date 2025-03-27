import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/Home Screen/home_screen.dart';  // Fixed import issue (no spaces in folder names)
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());  // Wrap the app inside MyApp widget
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'E-Waste App',

      initialRoute: '/home',
      routes: {
        '/home': (context) => HomeScreen(),
        '/': (context) => SplashScreen(),
        '/signup': (context) => SignupScreen(),
        '/login': (context) => LoginScreen(),

      },
    );
  }
}
