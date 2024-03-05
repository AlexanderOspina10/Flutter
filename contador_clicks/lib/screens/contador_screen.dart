import 'package:flutter/material.dart';

class ContadorScreen extends StatefulWidget {
  const ContadorScreen({super.key});

  @override
  State<ContadorScreen> createState() => _ContadorScreenState();
}
int contadorClicks = 0;
//TAREA AGREGAR EL MENOS QUE QUITE LOS CLICKS

class _ContadorScreenState extends State<ContadorScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.teal,
        title: Text('CONTADOR DE CLICKS: $contadorClicks'),
      ),
      body: const Center(
          child: Text('NUMERO DE CLICKS',
              style: TextStyle(
                  fontSize: 30, color: Color.fromARGB(255, 0, 0, 0)))),

      floatingActionButton: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FloatingActionButton(
              child: const Icon(Icons.add),
              onPressed: () {
              contadorClicks++;
              print(contadorClicks);
              setState(() {});
              }),

              Padding(
                padding: const EdgeInsets.all(8.0),
                child: FloatingActionButton(
                child: const Icon(Icons.remove_circle_outline_sharp),
                onPressed: () {
                contadorClicks--;
                print(contadorClicks);
                setState(() {});
                }),
              ),

               FloatingActionButton(
              child: const Icon(Icons.reset_tv_sharp),
              onPressed: () {
              contadorClicks=0;
              print(contadorClicks);
              setState(() {});
              }),
        ],
      ),

    );
  }
}