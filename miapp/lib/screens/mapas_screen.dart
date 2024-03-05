import 'package:flutter/material.dart';

class MapasScreen extends StatefulWidget {
  const MapasScreen({super.key});

  @override
  State<MapasScreen> createState() => _MapasScreenState();
}

final List<Map<String, dynamic>> listaDeProductos = [
  {'Referencia': '001', 'nombre': 'arepas', 'precio': 4000},
  {'Referencia': '002', 'nombre': 'leche', 'precio': 3800},
  {'Referencia': '003', 'nombre': 'salchichas', 'precio': 4500},
  {'Referencia': '004', 'nombre': 'salchichon', 'precio': 7000},
  {'Referencia': '005', 'nombre': 'harina', 'precio': 3200},
  {'Referencia': '006', 'nombre': 'quesito', 'precio': 4200},
  {'Referencia': '007', 'nombre': 'frutiño', 'precio': 1000},
  {'Referencia': '008', 'nombre': 'suntea', 'precio': 1200},
  {'Referencia': '009', 'nombre': 'Arina Pan', 'precio': 3400},
  {'Referencia': '010', 'nombre': 'papel', 'precio': 2600},
];

int numeroProductos = 0;


class _MapasScreenState extends State<MapasScreen> {
  @override
  Widget build(BuildContext context) {
    
    return Scaffold(
        appBar: AppBar(
          title: const Text('Recorrer Mapa'),
        ),
        body: ListView.builder(
            itemCount: listaDeProductos.length,
            itemBuilder: (BuildContext context, index) {
              return ListTile(
                leading: const Icon(Icons.production_quantity_limits,
                    color: Colors.teal, size: 50),
                title: Text(listaDeProductos[index]['Referencia']),
                subtitle: Text('Productos $numeroProductos'),
              );
            }));
  }
}
