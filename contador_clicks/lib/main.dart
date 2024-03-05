import 'package:contador_clicks/screens/contador_screen.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      //home: Text('Contador de clicks'),
      home: ContadorScreen(), //LLAMAR OTRO SCREEN
    );
  }
}
