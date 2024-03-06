import 'package:flutter/material.dart';

class ClientesScreen extends StatefulWidget {
  const ClientesScreen({super.key});

  @override
  State<ClientesScreen> createState() => _ClientesScreenState();
}

class _ClientesScreenState extends State<ClientesScreen> {
  final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();
  String nombreUsuario = '';
  String password = '';

  void registrar() {
    //En construcción
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Clientes',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: Colors.orange,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Form(
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.numbers, color: Colors.orange),
                hintText: "Documento",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                labelText: "Ingrese su documento",
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 24, 26, 25),
                    fontSize: 20,
                    fontFamily: AutofillHints.username),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person_add, color: Colors.orange),
                    hintText: "Nombre completo",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    labelText: "Ingrese su nombre",
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 24, 26, 25),
                        fontSize: 20,
                        fontFamily: AutofillHints.username))),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.email, color: Colors.orange),
                hintText: "Correo electronico",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                labelText: "Ingrese su correo electronico",
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 24, 26, 25),
                    fontSize: 20,
                    fontFamily: AutofillHints.username),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.phone, color: Colors.orange),
                hintText: "Telefono",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                labelText: "Ingrese su telefono",
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 24, 26, 25),
                    fontSize: 20,
                    fontFamily: AutofillHints.username),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.location_city, color: Colors.orange),
                hintText: "Direccion",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                labelText: "Ingrese su direccion",
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 24, 26, 25),
                    fontSize: 20,
                    fontFamily: AutofillHints.username),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password_outlined, color: Colors.orange),
                suffix: Icon(Icons.password_rounded),
                hintText: "Contraseña",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                labelText: "Contraseña",
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 24, 26, 25),
                    fontSize: 20,
                    fontFamily: AutofillHints.password),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password_outlined, color: Colors.orange),
                suffix: Icon(Icons.password_rounded),
                hintText: "Confirmar contraseña",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                labelText: "Confirme su contraseña",
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 24, 26, 25),
                    fontSize: 20,
                    fontFamily: AutofillHints.password),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.login, color: Colors.orange),
                hintText: "Estado",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                labelText: "Ingrese estado",
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 24, 26, 25),
                    fontSize: 20,
                    fontFamily: AutofillHints.username),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.orange),
                onPressed: registrar,
                icon: const Icon(Icons.login_rounded),
                label: const Text('Registrar')),
          ]),
        ),
      ),
    );
  }
}
