import 'package:flutter/material.dart';

class MisionScreen extends StatefulWidget {
  const MisionScreen({super.key});

  @override
  State<MisionScreen> createState() => _MisionScreenState();
}

class _MisionScreenState extends State<MisionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Misión'),
      ),
      body: Center(
          child: Container(
        color: Colors.yellow,
        //margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 150),
        height: 300.0,
        width: 300.0,
        child: const Text('Pruebasasssss'),
      )),
    );
  }
}
