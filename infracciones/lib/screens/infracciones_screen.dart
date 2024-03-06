import 'package:flutter/material.dart';

class InfraccionesScreen extends StatefulWidget {
  @override
  _InfraccionesScreenState createState() => _InfraccionesScreenState();
}

class _InfraccionesScreenState extends State<InfraccionesScreen> {
  final List<Map<String, dynamic>> infracciones = [];
  TextEditingController InfraccionesController = TextEditingController();

  void agregarInfraccion(String placa) {
    setState(() {
      infracciones.add({'Placa': placa});
    });
  }

  int contarInfracciones(String placa) {
    return infracciones
        .where((infraccion) => infraccion['Placa'] == placa)
        .length;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Infracciones'),
      ),
      //INICIO OPERACION
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                // Mostrar un cuadro de diálogo para ingresar la placa
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    String nuevaPlaca = '';
                    return AlertDialog(
                      title: const Text('Agregar Infracción'),
                      content: TextField(
                        onChanged: (value) {
                          nuevaPlaca = value;
                        },
                        decoration: const InputDecoration(
                            labelText: 'Ingrese la placa'),
                        maxLength: 6,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            agregarInfraccion(nuevaPlaca);
                            Navigator.of(context).pop();
                          },
                          child: const Text('Agregar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Agregar Infracción'),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                // Mostrar un cuadro de diálogo para ingresar la placa a consultar
                showDialog(
                  context: context,
                  builder: (BuildContext context) {
                    String placaConsulta = '';
                    return AlertDialog(
                      title: const Text('Consultar Infracciones'),
                      content: TextField(
                        onChanged: (value) {
                          placaConsulta = value;
                        },
                        decoration: const InputDecoration(
                            hintText: 'Ingrese la placa a consultar'),
                        maxLength: 6,
                      ),
                      actions: [
                        TextButton(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          child: const Text('Cancelar'),
                        ),
                        TextButton(
                          onPressed: () {
                            int cantidadInfracciones =
                                contarInfracciones(placaConsulta);
                            Navigator.of(context).pop();
                            showDialog(
                              context: context,
                              builder: (BuildContext context) {
                                return AlertDialog(
                                  title: Text('Infracciones de $placaConsulta'),
                                  content: Text(
                                      'Número de infracciones: $cantidadInfracciones'),
                                  actions: [
                                    TextButton(
                                      onPressed: () {
                                        Navigator.of(context).pop();
                                      },
                                      child: const Text('Cerrar'),
                                    ),
                                  ],
                                );
                              },
                            );
                          },
                          child: const Text('Consultar'),
                        ),
                      ],
                    );
                  },
                );
              },
              child: const Text('Consultar Infracciones'),
            ),
          ],
        ),
      ),
    );
  }
}
