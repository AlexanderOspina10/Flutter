import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:miapp/screens/menu_screen.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final GlobalKey<FormState> _formLogin = GlobalKey<FormState>();
  String nombreUsuario = '';
  String password = '';

  final Map<String, String> usuarios = {
    'sena': '1234',
    'johany': '2323',
    'jaime' : '2525',
    'juan' : '2626',


    // Agrega más usuarios según sea necesario
  };

  void Acceder(String nombreUsuario, String password) {
    print(nombreUsuario);
    print(password);

    //VALIDAR CON UN MAPA O UN ARRAY

    if (usuarios.containsKey(nombreUsuario) &&
        usuarios[nombreUsuario] == password) {
      final route =
          MaterialPageRoute(builder: (context) => const MenuScreen());
      Navigator.push(context, route);
    } else {
      //IMPLEMENTAR EL DIAGOLO ALERT
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
        backgroundColor: const Color.fromARGB(255, 21, 163, 130),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        child: Form(
          key: _formLogin,
          child: Column(children: [
            TextFormField(
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.person,
                      color: Color.fromARGB(255, 7, 189, 101)),
                  hintText: "Nombre de usuario",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  labelText: "Nombre Usuario",
                  labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontFamily: AutofillHints.username)),
              validator: (value) {
                //LA QUE VALIDA LOS DATOS
                if (value == null || value.isEmpty) {
                  return "Por favor ingrese su usuario";
                }
                return null;
              },
              onSaved: (value) {
                //ASIGNAR EL VALOR DE LA CAJA DE TEXTO
                nombreUsuario = value!;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            TextFormField(
              obscureText: true,
              decoration: const InputDecoration(
                  prefixIcon: Icon(Icons.password_outlined,
                      color: Color.fromARGB(255, 7, 189, 101)),
                  suffixIcon: Icon(Icons.password_rounded),
                  hintText: "Contraseña",
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(50))),
                  labelText: "ingrese una contraeña",
                  labelStyle: TextStyle(
                      color: Colors.red,
                      fontSize: 20,
                      fontFamily: AutofillHints.password)),
              validator: (value) {
                //LA QUE VALIDA LOS DATOS
                if (value == null || value.isEmpty) {
                  return "Por favor ingrese su contraseña";
                }
                return null;
              },
              onSaved: (value) {
                //ASIGNAR EL VALOR DE LA CAJA DE TEXTO
                password = value!;
              },
            ),
            const SizedBox(
              height: 16,
            ),
            ElevatedButton.icon(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
              ),
              onPressed: () {
                //VALIDAR LOS DATOS
                if (_formLogin.currentState!.validate()) {
                  _formLogin.currentState!.save();
                  Acceder(nombreUsuario, password);
                }
              },
              icon: const Icon(Icons.login_rounded),
              label: const Text('Acceder'),
            )
          ]),
        ),
      ),
    );
  }
}
