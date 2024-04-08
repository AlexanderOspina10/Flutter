import 'dart:convert';
//import 'dart:html';

import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class Http {
  static String url = "https://apinodemongo-iox5.onrender.com/api/usuarios";
  static postUsuario(Map usuario) async {
    try {
      final res = await http.post(Uri.parse(url),
          headers: {
            'Content-Type': 'application/json',
          },
          body: json.encode(usuario));
      if (res.statusCode == 200) {
        var data = jsonDecode(res.body.toString());
        print(data);
      } else {
        print("Fallo la inserción, contacte al administrador");
      }
    } catch (e) {
      print(e.toString());
    }
  }
}

class Registrar extends StatefulWidget {
  const Registrar({super.key});

  @override
  State<Registrar> createState() => _RegistrarState();
}

//Definir controladores para cada Text
TextEditingController nombre = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController password = TextEditingController();
TextEditingController rol = TextEditingController();

class _RegistrarState extends State<Registrar> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registrar Usuario'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(children: [
          TextField(
            controller: nombre,
            decoration: const InputDecoration(hintText: "Nombre usuario"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: email,
            decoration: const InputDecoration(hintText: "Email"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            obscureText: true,
            controller: password,
            decoration: const InputDecoration(hintText: "Password"),
          ),
          const SizedBox(
            height: 20,
          ),
          TextField(
            controller: rol,
            decoration: const InputDecoration(hintText: "Rol"),
          ),
          const SizedBox(
            height: 20,
          ),
          ElevatedButton.icon(
              onPressed: () {
                var usuario = {
                  "nombre": nombre.text,
                  "email": email.text,
                  "password": password.text,
                  "rol": rol.text
                };

                print(usuario);
                Http.postUsuario(usuario);
              },
              icon: Icon(Icons.save_as),
              label: Text('Registrar'))
        ]),
      ),
    );
  }
}
