import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class Proyecto {
  final String id;
  final String nombreProyecto;
  final int puntajeProyecto;
  final String foto;

  Proyecto({
    required this.id,
    required this.nombreProyecto,
    required this.puntajeProyecto,
    required this.foto,
  });

  factory Proyecto.fromJson(Map<String, dynamic> json) {
    return Proyecto(
      id: json['_id'],
      nombreProyecto: json['nombreProyecto'],
      puntajeProyecto: json['puntajeProyecto'],
      foto: json['Foto'],
    );
  }
}

Future<List<Proyecto>> fetchProyectos() async {
  final response = await http.get(
    Uri.parse('https://proyectoflutterbd.onrender.com/proyecto'),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body) as Map<String, dynamic>;
    final List<dynamic> proyectosJson = jsonData['msg'];
    return proyectosJson.map((json) => Proyecto.fromJson(json)).toList();
  } else {
    throw Exception('Fallo la carga de los proyectos');
  }
}

class ListarProyectos extends StatefulWidget {
  const ListarProyectos({super.key});

  @override
  State<ListarProyectos> createState() => _ListarProyectosState();
}

class _ListarProyectosState extends State<ListarProyectos> {
  late List<Proyecto> proyectos;
  late List<Proyecto> filteredProyectos;

  final TextEditingController _searchController = TextEditingController();

  @override
  void initState() {
    super.initState();
    filteredProyectos = [];
    fetchProyectos().then((list) {
      setState(() {
        proyectos = list;
        filteredProyectos = list;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Proyectos'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              controller: _searchController,
              onChanged: (value) {
                setState(() {
                  filteredProyectos = proyectos
                      .where((proyecto) => proyecto.nombreProyecto
                          .toLowerCase()
                          .contains(value.toLowerCase()))
                      .toList();
                });
              },
              decoration: const InputDecoration(
                labelText: "Buscar proyecto",
                hintText: "Ingrese el nombre del proyecto",
                prefixIcon: Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.all(
                    Radius.circular(25.0),
                  ),
                ),
              ),
            ),
          ),
          Expanded(
            child: RefreshIndicator(
              onRefresh: _refreshProyectos,
              child: ListView.builder(
                itemCount: filteredProyectos.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(filteredProyectos[index].nombreProyecto),
                    subtitle: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(filteredProyectos[index]
                            .puntajeProyecto
                            .toString()),
                        if (filteredProyectos[index].foto.isNotEmpty)
                          Image.memory(
                            base64Decode(filteredProyectos[index].foto),
                            height: 100,
                            width: 100,
                            fit: BoxFit.cover,
                          ),
                      ],
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        IconButton(
                          icon: const Icon(Icons.edit),
                          onPressed: () {
                            mostrarVentanaEdicion(
                                context, filteredProyectos[index]);
                            print('Editar');
                          },
                          tooltip: 'Editar proyecto',
                        ),
                        IconButton(
                          icon: const Icon(Icons.delete),
                          onPressed: () {
                            eliminarProyecto(filteredProyectos[index]);
                            print('Eliminar');
                          },
                          tooltip: 'Eliminar proyecto',
                        ),
                      ],
                    ),
                  );
                },
              ),
            ),
          ),
        ],
      ),
    );
  }

  Future<void> _refreshProyectos() async {
    await fetchProyectos().then((list) {
      setState(() {
        proyectos = list;
        filteredProyectos = list;
      });
    });
  }

  Future<void> editarProyecto(Proyecto proyecto) async {
    const String url = 'https://proyectoflutterbd.onrender.com/proyecto';

    final Map<String, dynamic> datosActualizados = {
      '_id': proyecto.id,
      'nombreProyecto': proyecto.nombreProyecto,
      'puntajeProyecto': proyecto.puntajeProyecto,
      'Foto': proyecto.foto,
    };

    final String cuerpoJson = jsonEncode(datosActualizados);

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: cuerpoJson,
      );

      if (response.statusCode == 200) {
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Proyecto actualizado'),
              content:
                  const Text('El proyecto ha sido actualizado correctamente.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: const Text('OK'),
                ),
              ],
            );
          },
        );
        await _refreshProyectos();
      } else {
        print('Error al editar proyecto: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error al realizar la solicitud: $e');
    }
  }

  void mostrarVentanaEdicion(BuildContext context, Proyecto proyecto) {
    TextEditingController nombreProyectoController =
        TextEditingController(text: proyecto.nombreProyecto);
    TextEditingController puntajeProyectoController =
        TextEditingController(text: proyecto.puntajeProyecto.toString());
    TextEditingController fotoController =
        TextEditingController(text: proyecto.foto);

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar proyecto'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nombreProyectoController,
                  decoration:
                      const InputDecoration(labelText: 'Nombre proyecto'),
                ),
                TextField(
                  controller: puntajeProyectoController,
                  decoration:
                      const InputDecoration(labelText: 'Puntaje proyecto'),
                  keyboardType: TextInputType.number,
                ),
                TextField(
                  controller: fotoController,
                  decoration: const InputDecoration(labelText: 'Foto'),
                  keyboardType: TextInputType.number,
                ),
              ],
            ),
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
                int puntajeProyecto = int.parse(puntajeProyectoController.text);

                Proyecto proyectoActualizada = Proyecto(
                  id: proyecto.id,
                  nombreProyecto: nombreProyectoController.text,
                  puntajeProyecto: puntajeProyecto,
                  foto: fotoController.text,
                );
                editarProyecto(proyectoActualizada);
                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  void eliminarProyecto(Proyecto proyecto) async {
    bool confirmarEliminacion = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text("Confirmar eliminación"),
          content:
              const Text("¿Estás seguro de que deseas eliminar este proyecto?"),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false);
              },
              child: const Text("Cancelar"),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true);
              },
              child: const Text("Eliminar"),
            ),
          ],
        );
      },
    );

    if (confirmarEliminacion == true) {
      try {
        String url =
            'https://proyectoflutterbd.onrender.com/proyecto?id=${proyecto.id}';
        final response = await http.delete(Uri.parse(url));

        if (response.statusCode == 200) {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Proyecto eliminado'),
                content:
                    const Text('El proyecto ha sido eliminado correctamente.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: const Text('OK'),
                  ),
                ],
              );
            },
          );
          await _refreshProyectos();
        } else {
          print('Error al eliminar proyecto: ${response.statusCode}');
        }
      } catch (e) {
        print('Error al eliminar proyecto: $e');
      }
    }
  }
}
