import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();
  String nombreUsuario = '';
  String password = '';

  void acceder() {
    //En construcción
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Form(
          child: Column(children: [
            TextFormField(
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.person,
                        color: Color.fromARGB(255, 7, 189, 101)),
                    hintText: "Nombre de usuario",
                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.all(Radius.circular(50))),
                    labelText: "Digitar Usuario",
                    labelStyle: TextStyle(
                        color: Color.fromARGB(255, 28, 55, 35),
                        fontSize: 20,
                        fontFamily: AutofillHints.username))),
            const SizedBox(
              height: 30,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                prefixIcon: Icon(Icons.password_outlined,
                    color: Color.fromARGB(255, 7, 189, 101)),
                suffix: Icon(Icons.password_rounded),
                hintText: "Contraseña",
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.all(Radius.circular(50))),
                labelText: "Contraseña",
                labelStyle: TextStyle(
                    color: Color.fromARGB(255, 28, 55, 35),
                    fontSize: 20,
                    fontFamily: AutofillHints.password),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            ElevatedButton.icon(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.green),
                onPressed: acceder,
                icon: const Icon(Icons.login_rounded),
                label: const Text('Acceder'))
          ]),
        ),
      ),
    );
  }
}
