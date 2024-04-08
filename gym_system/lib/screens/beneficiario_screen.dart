import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class BeneficiariosScreen extends StatefulWidget {
  const BeneficiariosScreen({Key? key}) : super(key: key);

  @override
  State<BeneficiariosScreen> createState() => _BeneficiariosScreenState();
}

class _BeneficiariosScreenState extends State<BeneficiariosScreen> {
  final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();
  TextEditingController tipoDocumentoController = TextEditingController();
  TextEditingController documentoController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController estadoController = TextEditingController();

  Future<void> registrarBeneficiario() async {
    if (_formLogin.currentState!.validate()) {
      try {
        final response = await http.post(
          Uri.parse('https://bdgymflutter.onrender.com/Beneficiario'),
          headers: <String, String>{
            'Content-Type': 'application/json',
          },
          body: jsonEncode(<String, dynamic>{
            'tipoDocumento': tipoDocumentoController.text,
            'documentoBeneficiario': documentoController.text,
            'nombreBeneficiario': nombreController.text,
            'correoBeneficiario': correoController.text,
            'telefonoBeneficiario': telefonoController.text,
            'direccionBeneficiario': direccionController.text,
            'estadoBeneficiario': estadoController.text
          }),
        );
        if (response.statusCode == 200) {
          // Beneficiario registrado exitosamente
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Registro exitoso'),
                content: const Text(
                    'El Beneficiario se ha registrado correctamente.'),
                actions: [
                  TextButton(
                    onPressed: () {
                      // Regresar al menú
                      Navigator.pop(context);
                      Navigator.pop(context);
                    },
                    child: const Text('Aceptar'),
                  ),
                ],
              );
            },
          );
        } else {
          // Error al registrar el Beneficiario
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: const Text('Error en el registro'),
                content: Text(
                    'Error al registrar el Beneficiario: ${response.statusCode}'),
                actions: [
                  TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: const Text('Aceptar'),
                  ),
                ],
              );
            },
          );
        }
      } catch (e) {
        print('Error: $e');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registrar beneficiarios',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: Colors.orange,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
          child: Form(
            key: _formLogin,
            child: Column(
              children: [
                TextFormField(
                  controller: tipoDocumentoController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.type_specimen_outlined,
                        color: Colors.orange),
                    hintText: "Tipo de documento",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    labelText: "Ingrese su tipo de documento",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su tipo de documento';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: documentoController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.numbers, color: Colors.orange),
                    hintText: "Documento",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    labelText: "Ingrese su documento",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su documento';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: nombreController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_add, color: Colors.orange),
                    hintText: "Nombre completo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    labelText: "Ingrese su nombre",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su nombre';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: correoController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.email, color: Colors.orange),
                    hintText: "Correo electrónico",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    labelText: "Ingrese su correo electrónico",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su correo electrónico';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: telefonoController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.phone, color: Colors.orange),
                    hintText: "Teléfono",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    labelText: "Ingrese su teléfono",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su teléfono';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: direccionController,
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.location_city, color: Colors.orange),
                    hintText: "Dirección",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    labelText: "Ingrese su dirección",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su dirección';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                DropdownButtonFormField<bool>(
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.login, color: Colors.orange),
                    hintText: "Estado",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50)),
                    ),
                    labelText: "Seleccione estado",
                  ),
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
                  validator: (value) {
                    if (value == null) {
                      return 'Por favor seleccione el estado';
                    }
                    return null;
                  },
                  onChanged: (value) {
                    // Actualiza el valor del controlador con el valor seleccionado
                    estadoController.text = value.toString();
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: registrarBeneficiario,
                  icon: const Icon(Icons.login_rounded),
                  label: const Text('Registrar'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
