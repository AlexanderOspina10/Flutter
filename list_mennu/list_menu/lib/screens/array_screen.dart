import 'package:flutter/material.dart';

class ArrayScreen extends StatefulWidget {
  const ArrayScreen({super.key});

  @override
  State<ArrayScreen> createState() => _ArrayScreenState();
}

final List<String> aprendices = [
  'Andres',
  'Carmen',
  'Devora',
  'Katrina',
  'Nidia',
  'Tomas'
];

int numeroAprendiz = 0;

class _ArrayScreenState extends State<ArrayScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Array'),
        ),
        body: ListView.builder(
          itemCount: aprendices.length, //Longitud del array
          itemBuilder: (BuildContext context, int index) {
            numeroAprendiz++;
            return ListTile(
              leading: const Icon(
                Icons.person_2_outlined,
                color: Colors.blue,
                size: 50,
              ),
              title: Text(aprendices[index]),
              subtitle: Text('Aprendiz $numeroAprendiz'),
            );
          },
        ));
  }
}
