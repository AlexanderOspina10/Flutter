import 'package:flutter/material.dart';

class ScreenArray extends StatefulWidget {
  const ScreenArray({super.key});

  @override
  State<ScreenArray> createState() => _ScreenArrayState();
}

final List<String> aprendices = ['Andrea', 'Carmen', 'Devora', 'Katrina', 'Nidia', 'Tomas'];
 int numeroAprendices = 0;

class _ScreenArrayState extends State<ScreenArray> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recorrido Array'),
        ),
        body: ListView.builder(
            itemCount: aprendices.length, //OBTENER LONGITUD DE LA ARRAY
            itemBuilder: (BuildContext context, int index) {
              numeroAprendices++;
              return ListTile(
                leading: const Icon(Icons.person_3_outlined, color: Colors.teal, size: 50,),
                title: Text(aprendices[index]),
                subtitle: Text('Aprendices $numeroAprendices'),
              );
            })
            );
  }
}
