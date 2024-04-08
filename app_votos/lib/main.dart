import 'package:app_votos/Screens/votacion_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp()); //Ejecutar la principal
}

//Nos permite crear los Screen para la App

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Text('Mi app', style: TextStyle(color: Colors.lightBlue))
      home: VotacionScreen()
    );
  }
}