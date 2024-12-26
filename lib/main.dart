import 'package:aplikasi_tani/dashboard.dart';
import 'package:aplikasi_tani/login.dart';
import 'package:aplikasi_tani/splashscreen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
            fontFamily: 'Montserrat', splashColor: Colors.transparent),
        initialRoute: '/',
        routes: {
          '/': (context) => SplashScreen(),
          '/login': (context) => HalamanLogin(),
          '/dashboard': (context) => HalamanDashboard(),
        });
  }
}
