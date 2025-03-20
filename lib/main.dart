import 'package:flutter/material.dart';
import 'screens/splash_screen.dart';
import 'screens/auth/signup_screen.dart';
import 'screens/auth/login_screen.dart';
import 'screens/home_screen.dart';

void main() {
  runApp(MaterialApp(
    debugShowCheckedModeBanner: false,
    title: 'E-Waste App',
    initialRoute: '/',
    routes: {
      '/': (context) => SplashScreen(),
      '/signup': (context) => SignupScreen(),
      '/login': (context) => LoginScreen(),
      '/home': (context) => HomeScreen(),
    },
  ));
}
