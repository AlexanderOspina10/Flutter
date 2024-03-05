import 'package:flutter/material.dart';

class MisionScreen extends StatefulWidget {
  const MisionScreen({super.key});

  @override
  State<MisionScreen> createState() => _MisionScreen();
}

class _MisionScreen extends State<MisionScreen> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar: AppBar(
        title:  const Text('Mision', ) ,
        backgroundColor: Colors.tealAccent,
      ),
      body: Center(
        child: Container(
          color: Colors.yellow,
         // margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 300),
          height: 300.0,
          width: 300.0,
          child: const Text('Producir sofware con altos estandares de "calidad", empleando flutter'),
        ),
      ),
    );
  }
}