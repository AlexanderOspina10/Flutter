import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

// Clase para representar un beneficiario
class Beneficiario {
  final String id;
  final String tipoDocumento;
  final int documento;
  final String nombre;
  final String correo;
  final int telefono;
  final String direccion;
  final bool estado;

  Beneficiario({
    required this.id,
    required this.tipoDocumento,
    required this.documento,
    required this.nombre,
    required this.correo,
    required this.telefono,
    required this.direccion,
    required this.estado,
  });

  // Función para crear un objeto Beneficiario desde un JSON
  factory Beneficiario.fromJson(Map<String, dynamic> json) {
    return Beneficiario(
      id: json['_id'],
      tipoDocumento: json['tipoDocumento'],
      documento: json['documentoBeneficiario'],
      nombre: json['nombreBeneficiario'],
      correo: json['correoBeneficiario'],
      telefono: json['telefonoBeneficiario'],
      direccion: json['direccionBeneficiario'],
      estado: json['estadoBeneficiario'],
    );
  }
}

// Función para obtener la lista de beneficiarios desde la API
Future<List<Beneficiario>> fetchBeneficiarios() async {
  final response = await http.get(
    Uri.parse('https://bdgymflutter.onrender.com/beneficiario'),
  );

  if (response.statusCode == 200) {
    final jsonData = json.decode(response.body) as Map<String, dynamic>;
    final List<dynamic> beneficiariosJson = jsonData['msg'];
    return beneficiariosJson
        .map((json) => Beneficiario.fromJson(json))
        .toList();
  } else {
    throw Exception('Fallo la carga de los beneficiarios');
  }
}

class ListarBeneficiariosScreen extends StatefulWidget {
  const ListarBeneficiariosScreen({Key? key}) : super(key: key);

  @override
  State<ListarBeneficiariosScreen> createState() =>
      _ListarBeneficiariosScreenState();
}

class _ListarBeneficiariosScreenState extends State<ListarBeneficiariosScreen> {
  // Variable de estado para almacenar la búsqueda
  String searchQuery = '';

  // Función para editar un beneficiario
  Future<void> editarBeneficiario(Beneficiario beneficiario) async {
    const String url = 'https://bdgymflutter.onrender.com/beneficiario';

    final Map<String, dynamic> datosActualizados = {
      'tipoDocumento': beneficiario.tipoDocumento,
      'documentoBeneficiario': beneficiario.documento,
      'nombreBeneficiario': beneficiario.nombre,
      'correoBeneficiario': beneficiario.correo,
      'telefonoBeneficiario': beneficiario.telefono,
      'direccionBeneficiario': beneficiario.direccion,
      'estadoBeneficiario': beneficiario.estado,
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
              title: Text('Beneficiario Actualizado'),
              content:
                  Text('El beneficiario ha sido actualizado correctamente.'),
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
        print('Error al editar beneficiario: ${response.reasonPhrase}');
      }
    } catch (e) {
      print('Error al realizar la solicitud: $e');
    }
  }

  // Función para mostrar la ventana de edición de beneficiario
  void mostrarVentanaEdicion(BuildContext context, Beneficiario beneficiario) {
    TextEditingController tipoDocumentoController =
        TextEditingController(text: beneficiario.tipoDocumento);
    TextEditingController nombreController =
        TextEditingController(text: beneficiario.nombre);
    TextEditingController correoController =
        TextEditingController(text: beneficiario.correo);
    TextEditingController telefonoController =
        TextEditingController(text: beneficiario.telefono.toString());
    TextEditingController direccionController =
        TextEditingController(text: beneficiario.direccion);
    bool estadoValue = beneficiario.estado;

    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Editar Beneficiario'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                TextField(
                  controller: tipoDocumentoController,
                  decoration:
                      const InputDecoration(labelText: 'Tipo documetno'),
                ),
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
                Beneficiario beneficiarioActualizado = Beneficiario(
                  id: beneficiario.id,
                  tipoDocumento: beneficiario.tipoDocumento,
                  documento: beneficiario.documento,
                  nombre: nombreController.text,
                  correo: correoController.text,
                  telefono: int.parse(telefonoController.text),
                  direccion: direccionController.text,
                  estado: estadoValue,
                );
                editarBeneficiario(beneficiarioActualizado);
                Navigator.of(context).pop();
              },
              child: const Text('Guardar'),
            ),
          ],
        );
      },
    );
  }

  // Función para eliminar un beneficiario
  Future<void> eliminarBeneficiario(
      BuildContext context, Beneficiario beneficiario) async {
    // Mostrar una alerta de confirmación
    bool confirmarEliminacion = await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Confirmar Eliminación'),
          content:
              Text('¿Estás seguro de que deseas eliminar este beneficiario?'),
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
      final String url = 'https://bdgymflutter.onrender.com/beneficiario';

      try {
        // Realiza la solicitud DELETE al servidor
        final response = await http.delete(
          Uri.parse('$url?documentoBeneficiario=${beneficiario.documento}'),
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
                title: Text('Beneficiario Eliminado'),
                content:
                    Text('El beneficiario ha sido eliminado correctamente.'),
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
          print('Error al eliminar beneficiario: ${response.reasonPhrase}');
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
        title: const Text('Beneficiarios'),
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
            child: FutureBuilder<List<Beneficiario>>(
              future: fetchBeneficiarios(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                } else if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                } else {
                  List<Beneficiario> beneficiarios = snapshot.data!;
                  // Filtrar la lista de beneficiarios según la búsqueda
                  List<Beneficiario> beneficiariosFiltrados = beneficiarios
                      .where((beneficiario) => beneficiario.documento
                          .toString()
                          .contains(searchQuery))
                      .toList();
                  return ListView.builder(
                    itemCount: beneficiariosFiltrados.length,
                    itemBuilder: (context, index) {
                      return ListTile(
                        title: Text(beneficiariosFiltrados[index].nombre),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                                'Tipo documento: ${beneficiariosFiltrados[index].tipoDocumento}'),
                            Text(
                                'Documento: ${beneficiariosFiltrados[index].documento}'),
                            Text(
                                'Correo: ${beneficiariosFiltrados[index].correo}'),
                            Text(
                                'Teléfono: ${beneficiariosFiltrados[index].telefono}'),
                            Text(
                                'Dirección: ${beneficiariosFiltrados[index].direccion}'),
                            Text(
                                'Estado: ${beneficiariosFiltrados[index].estado}'),
                          ],
                        ),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: const Icon(Icons.edit),
                              onPressed: () {
                                mostrarVentanaEdicion(
                                    context, beneficiariosFiltrados[index]);
                              },
                            ),
                            IconButton(
                              icon: const Icon(Icons.delete),
                              onPressed: () {
                                eliminarBeneficiario(
                                    context, beneficiariosFiltrados[index]);
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
