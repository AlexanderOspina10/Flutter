import 'package:flutter/material.dart';
import 'package:gym_system/screens/beneficiario_screen.dart';
//import 'package:gym_system/screens/beneficiarios_screen.dart';
import 'package:gym_system/screens/clientes_screen.dart';
//import 'package:gym_system/screens/detalle_screen.dart';
import 'package:gym_system/screens/listar_screen.dart';
import 'package:gym_system/screens/listarbeneficiarios_screen.dart';
import 'package:gym_system/screens/login_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Función para mostrar un diálogo de confirmación al usuario
  Future<void> cerrarSesion(BuildContext context) async {
    return showDialog<void>(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('Cerrar sesión'),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text('¿Estás seguro de que deseas cerrar sesión?'),
              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child: Text('Cancelar'),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            TextButton(
              child: Text('Cerrar sesión'),
              onPressed: () {
                Navigator.of(context)
                    .pop(); // Cierra el diálogo de confirmación
                Navigator.pushReplacement(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            LoginScreen())); // Navega a la pantalla de inicio de sesión
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GYM SYSTEM',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: Colors.orange,
        actions: [
          IconButton(
            icon: Icon(Icons.exit_to_app),
            onPressed: () {
              cerrarSesion(
                  context); // Mostrar el diálogo de confirmación al presionar el botón
            },
          ),
        ],
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView(
              children: [
                const ListTile(
                  title: Text('Home'),
                  subtitle: Text('Inicio de la aplicación'),
                  leading: Icon(
                    Icons.home,
                    color: Colors.orange,
                  ),
                  trailing:
                      Icon(Icons.navigate_next_outlined, color: Colors.orange),
                ),
                ListTile(
                  title: const Text('Clientes'),
                  subtitle: const Text('Modulo de clientes'),
                  leading: const Icon(Icons.people_alt_outlined,
                      color: Colors.orange),
                  trailing: const Icon(Icons.navigate_next_outlined,
                      color: Colors.orange),
                  onTap: () {
                    //ABRIR OTRO SCREEN
                    final route = MaterialPageRoute(
                        builder: (context) => const ClientesScreen());
                    Navigator.push(context, route);
                  },
                ),
                ListTile(
                  title: const Text('Listar clientes'),
                  subtitle: const Text('Modulo de clientes'),
                  leading: const Icon(Icons.people_alt_outlined,
                      color: Colors.orange),
                  trailing: const Icon(Icons.navigate_next_outlined,
                      color: Colors.orange),
                  onTap: () {
                    //ABRIR OTRO SCREEN
                    final route = MaterialPageRoute(
                        builder: (context) => const ListarClientesScreen());
                    Navigator.push(context, route);
                  },
                ),
                ListTile(
                  title: const Text('Beneficiarios'),
                  subtitle: const Text('Modulo de beneficiarios'),
                  leading: const Icon(Icons.people_alt_outlined,
                      color: Colors.orange),
                  trailing: const Icon(Icons.navigate_next_outlined,
                      color: Colors.orange),
                  onTap: () {
                    //ABRIR OTRO SCREEN
                    final route = MaterialPageRoute(
                        builder: (context) => const BeneficiariosScreen());
                    Navigator.push(context, route);
                  },
                ),
                ListTile(
                  title: const Text('Listar beneficiarios'),
                  subtitle: const Text('Modulo de beneficiarios'),
                  leading: const Icon(Icons.people_alt_outlined,
                      color: Colors.orange),
                  trailing: const Icon(Icons.navigate_next_outlined,
                      color: Colors.orange),
                  onTap: () {
                    //ABRIR OTRO SCREEN
                    final route = MaterialPageRoute(
                        builder: (context) =>
                            const ListarBeneficiariosScreen());
                    Navigator.push(context, route);
                  },
                ),
              ],
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
