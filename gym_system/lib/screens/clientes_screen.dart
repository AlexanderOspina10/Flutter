import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class ClientesScreen extends StatefulWidget {
  const ClientesScreen({Key? key}) : super(key: key);

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();
  TextEditingController documentoController = TextEditingController();
  TextEditingController nombreController = TextEditingController();
  TextEditingController correoController = TextEditingController();
  TextEditingController telefonoController = TextEditingController();
  TextEditingController direccionController = TextEditingController();
  TextEditingController estadoController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController confirmPasswordController = TextEditingController();

  Future<void> registrarCliente() async {
    if (_formLogin.currentState!.validate()) {
      if (passwordController.text == confirmPasswordController.text) {
        try {
          final response = await http.post(
            Uri.parse('https://bdgymflutter.onrender.com/cliente'),
            headers: <String, String>{
              'Content-Type': 'application/json',
            },
            body: jsonEncode(<String, dynamic>{
              'documentoCliente': documentoController.text,
              'nombreCliente': nombreController.text,
              'correoCliente': correoController.text,
              'telefonoCliente': telefonoController.text,
              'direccionCliente': direccionController.text,
              'estadoCliente': estadoController.text,
              'password': passwordController.text,
            }),
          );
          if (response.statusCode == 200) {
            // Cliente registrado exitosamente
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Registro exitoso'),
                  content:
                      const Text('El cliente se ha registrado correctamente.'),
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
            // Error al registrar el cliente
            showDialog(
              context: context,
              builder: (BuildContext context) {
                return AlertDialog(
                  title: const Text('Error en el registro'),
                  content: Text(
                      'Error al registrar el cliente: ${response.statusCode}'),
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
      } else {
        // Las contraseñas no coinciden
        print('Las contraseñas no coinciden');
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Registrar clientes',
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
                TextFormField(
                  controller: passwordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon:
                        Icon(Icons.password_outlined, color: Colors.orange),
                    hintText: "Contraseña",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    labelText: "Contraseña",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingrese su contraseña';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                TextFormField(
                  controller: confirmPasswordController,
                  obscureText: true,
                  decoration: const InputDecoration(
                    prefixIcon:
                        Icon(Icons.password_outlined, color: Colors.orange),
                    hintText: "Confirmar contraseña",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    labelText: "Confirmar contraseña",
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor confirme su contraseña';
                    }
                    if (value != passwordController.text) {
                      return 'Las contraseñas no coinciden';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 8),
                ElevatedButton.icon(
                  style:
                      ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                  onPressed: registrarCliente,
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
