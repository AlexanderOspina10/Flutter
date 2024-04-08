import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gym_system/screens/menu_screen.dart';
import 'package:http/http.dart' as http;

class LoginScreen extends StatefulWidget {
  const LoginScreen({Key? key}) : super(key: key);

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();
  String nombreUsuario = '';
  String password = '';
  String apiUrl = 'https://bdgymflutter.onrender.com/cliente';

  Future<bool> acceder(String nombreUsuario, String password) async {
    final response = await http.get(Uri.parse(apiUrl));
    if (response.statusCode == 200) {
      final data = json.decode(response.body)['msg'] as List<dynamic>;
      for (var cliente in data) {
        if (cliente['documentoCliente'].toString() == nombreUsuario &&
            cliente['password'] == password) {
          return true;
        }
      }
    }
    return false;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: Colors.orangeAccent,
      ),
      body: Column(
        children: [
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                child: Form(
                  key: _formLogin,
                  child: Column(
                    children: [
                      const Image(
                        image: AssetImage('../assets/images/logo.jpg'),
                        fit: BoxFit.contain,
                      ),
                      TextFormField(
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.person, color: Colors.orange),
                          hintText: "Documento del cliente",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          labelText: "Documento del cliente",
                          labelStyle: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor ingrese su documento";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          nombreUsuario = value!;
                        },
                      ),
                      SizedBox(height: 16),
                      TextFormField(
                        obscureText: true,
                        decoration: const InputDecoration(
                          prefixIcon: Icon(Icons.password_outlined,
                              color: Colors.orange),
                          suffixIcon: Icon(Icons.password_rounded),
                          hintText: "Contraseña",
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(50)),
                          ),
                          labelText: "Ingrese la contraseña",
                          labelStyle: TextStyle(
                            color: Colors.orange,
                            fontSize: 20,
                          ),
                        ),
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return "Por favor ingrese su contraseña";
                          }
                          return null;
                        },
                        onSaved: (value) {
                          password = value!;
                        },
                      ),
                      SizedBox(height: 16),
                      ElevatedButton.icon(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: Colors.orange,
                        ),
                        onPressed: () async {
                          if (_formLogin.currentState!.validate()) {
                            _formLogin.currentState!.save();
                            bool loggedIn =
                                await acceder(nombreUsuario, password);
                            if (loggedIn) {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const MenuScreen()),
                              );
                            } else {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return const CupertinoAlertDialog(
                                    title: Text('Datos incorrectos'),
                                    content: Icon(Icons.error_outline_outlined),
                                  );
                                },
                              );
                            }
                          }
                        },
                        icon: const Icon(Icons.login_rounded),
                        label: Text('Acceder'),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
          Container(
            color: Colors.orange, // Color del footer
            padding: EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  'Yonier Ospina',
                  style: TextStyle(color: Colors.black),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
