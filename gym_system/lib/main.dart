import 'package:flutter/material.dart';
import 'package:gym_system/screens/login_screen.dart';
//import 'package:gym_system/screens/menu_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  MainAppState createState() => MainAppState();

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: LoginScreen(),
    );
  }
}

class MainAppState {}
