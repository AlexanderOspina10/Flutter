//import 'package:consumir_api/screeen/listar_departamentos.dart';
import 'package:consumir_api/screeen/registrar.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const Main());
}

class Main extends StatefulWidget {
  const Main({super.key});

  @override
  State<Main> createState() => _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: Registrar(),
      debugShowCheckedModeBanner: false,
    );
  }
}
