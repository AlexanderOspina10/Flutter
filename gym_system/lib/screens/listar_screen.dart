import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Clase para representar un cliente
class Cliente {
  final String id;
  final int documento;
  final String nombre;
  final String correo;
  final int telefono;
  final String direccion;
  final bool estado;

  Cliente({
    required this.id,
    required this.documento,
    required this.nombre,
    required this.correo,
    required this.telefono,
    required this.direccion,
    required this.estado,
  });

  // Función para crear un objeto Cliente desde un JSON
  factory Cliente.fromJson(Map<String, dynamic> json) {
    return Cliente(
      id: json['_id'],
      documento: json['documentoCliente'],
      nombre: json['nombreCliente'],
      correo: json['correoCliente'],
      telefono: json['telefonoCliente'],
      direccion: json['direccionCliente'],
      estado: json['estadoCliente'],
    );
  }
}

// Función para obtener la lista de clientes desde la API
Future<List<Cliente>> fetchClientes() async {
  final response = await http.get(
    Uri.parse('https://bdgymflutter.onrender.com/cliente'),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body) as Map<String, dynamic>;
    final List<dynamic> clientesJson = jsonData['msg'];
    return clientesJson.map((json) => Cliente.fromJson(json)).toList();
  } else {
    throw Exception('Fallo la carga de los clientes');
  }
}

class ListarClientesScreen extends StatefulWidget {
  const ListarClientesScreen({Key? key}) : super(key: key);

  @override
  State<ListarClientesScreen> createState() => _ListarClientesScreenState();
}

class _ListarClientesScreenState extends State<ListarClientesScreen> {
  // Variable de estado para almacenar la búsqueda
  String searchQuery = '';

  // Función para editar un cliente
  Future<void> editarCliente(Cliente cliente) async {
    const String url = 'https://bdgymflutter.onrender.com/cliente';

    final Map<String, dynamic> datosActualizados = {
      'documentoCliente': cliente.documento,
      'nombreCliente': cliente.nombre,
      'correoCliente': cliente.correo,
      'telefonoCliente': cliente.telefono,
      'direccionCliente': cliente.direccion,
      'estadoCliente': cliente.estado,
    };

    final String cuerpoJson = jsonEncode(datosActualizados);

    try {
      final response = await http.put(
        Uri.parse(url),
        headers: {'Content-Type': 'application/json'},
        body: cuerpoJson,
      );
      if (response.statusCode == 200) {
        // Mostrar diálogo de actualización exitosa
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: Text('Cliente Actualizado'),
              content: Text('El cliente ha sido actualizado correctamente.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                    setState(() {});
                  },
                  child: Text('OK'),
                ),
              ],
            );
          },
        );
      } else {
        print('Error al editar cliente: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error al realizar la solicitud: $e');
    }
  }

  // Función para mostrar la ventana de edición de cliente
  void mostrarVentanaEdicion(BuildContext context, Cliente cliente) {
    TextEditingController nombreController =
        TextEditingController(text: cliente.nombre);
    TextEditingController correoController =
        TextEditingController(text: cliente.correo);
    TextEditingController telefonoController =
        TextEditingController(text: cliente.telefono.toString());
    TextEditingController direccionController =
        TextEditingController(text: cliente.direccion);
    bool estadoValue = cliente.estado;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Cliente'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: nombreController,
                  decoration: const InputDecoration(labelText: 'Nombre'),
                ),
                TextField(
                  controller: correoController,
                  decoration: const InputDecoration(labelText: 'Correo'),
                ),
                TextField(
                  controller: telefonoController,
                  decoration: const InputDecoration(labelText: 'Teléfono'),
                ),
                TextField(
                  controller: direccionController,
                  decoration: const InputDecoration(labelText: 'Dirección'),
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<bool>(
                  decoration: const InputDecoration(
                    hintText: "Estado",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    labelText: "Seleccione estado",
                  ),
                  value: estadoValue,
                  items: const [
                    DropdownMenuItem<bool>(
                      value: true,
                      child: Text("Activo"),
                    ),
                    DropdownMenuItem<bool>(
                      value: false,
                      child: Text("Inactivo"),
                    ),
                  ],
                  onChanged: (value) {
                    estadoValue = value!;
                  },
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
                Cliente clienteActualizado = Cliente(
                  id: cliente.id,
                  documento: cliente.documento,
                  nombre: nombreController.text,
                  correo: correoController.text,
                  telefono: int.parse(telefonoController.text),
                  direccion: direccionController.text,
                  estado: estadoValue,
                );
                editarCliente(clienteActualizado);
                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  // Función para eliminar un cliente
  Future<void> eliminarCliente(BuildContext context, Cliente cliente) async {
    // Mostrar una alerta de confirmación
    bool confirmarEliminacion = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Eliminación'),
          content: Text('¿Estás seguro de que deseas eliminar este cliente?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(false); // No confirmar eliminación
              },
              child: Text('Cancelar'),
            ),
            TextButton(
              onPressed: () {
                Navigator.of(context).pop(true); // Confirmar eliminación
              },
              child: Text('Eliminar'),
            ),
          ],
        );
      },
    );

    // Si el usuario confirma la eliminación, procede con la solicitud DELETE
    if (confirmarEliminacion == true) {
      // URL de la API donde se encuentra el recurso a eliminar
      final String url = 'https://bdgymflutter.onrender.com/cliente';

      try {
        // Realiza la solicitud DELETE al servidor
        final response = await http.delete(
          Uri.parse('$url?documentoCliente=${cliente.documento}'),
          headers: {'Content-Type': 'application/json'},
        );

        // Verifica si la solicitud fue exitosa (código de estado 200)
        if (response.statusCode == 200) {
          //setState(() {});
          // Mostrar diálogo de eliminación exitosa
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Cliente Eliminado'),
                content: Text('El cliente ha sido eliminado correctamente.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                      setState(() {});
                    },
                    child: Text('OK'),
                  ),
                ],
              );
            },
          );
        } else {
          print('Error al eliminar cliente: ${response.reasonPhrase}');
        }
      } catch (e) {
        print('Error al realizar la solicitud: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Clientes'),
        backgroundColor: Colors.orange,
      ),
      body: Column(
        children: [
          // Campo de texto para buscar por documento
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: const InputDecoration(
                hintText: 'Buscar por documento',
                prefixIcon: Icon(Icons.search),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Expanded(
            child: FutureBuilder<List<Cliente>>(
              future: fetchClientes(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Cliente> clientes = snapshot.data!;
                  // Filtrar la lista de clientes según la búsqueda
                  List<Cliente> clientesFiltrados = clientes
                      .where((cliente) =>
                          cliente.documento.toString().contains(searchQuery))
                      .toList();
                  return ListView.builder(
                    itemCount: clientesFiltrados.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(clientesFiltrados[index].nombre),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Documento: ${clientesFiltrados[index].documento}'),
                            Text('Correo: ${clientesFiltrados[index].correo}'),
                            Text(
                                'Teléfono: ${clientesFiltrados[index].telefono}'),
                            Text(
                                'Dirección: ${clientesFiltrados[index].direccion}'),
                            Text('Estado: ${clientesFiltrados[index].estado}'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                mostrarVentanaEdicion(
                                    context, clientesFiltrados[index]);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                eliminarCliente(
                                    context, clientesFiltrados[index]);
                              },
                            ),
                          ],
                        ),
                      );
                    },
                  );
                }
              },
            ),
          ),
        ],
      ),
    );
  }
}
