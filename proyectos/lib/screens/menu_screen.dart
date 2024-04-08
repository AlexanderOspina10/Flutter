import 'package:flutter/material.dart';
import 'package:proyectos/screens/listar_screen.dart';
//import 'package:gym_system/screens/beneficiarios_screen.dart';
//import 'package:gym_system/screens/clientes_screen.dart';
//import 'package:gym_system/screens/detalle_screen.dart';
//import 'package:gym_system/screens/listar_screen.dart';
//import 'package:gym_system/screens/login_screen.dart';
import 'package:proyectos/screens/proyecto_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  // Función para mostrar un diálogo de confirmación al usuario

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          title: const Text(
            'PROYECTOS',
            style: TextStyle(color: Colors.black, fontSize: 30),
          ),
          backgroundColor: Colors.orange),
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
                  title: const Text('Proyectos'),
                  subtitle: const Text('Modulo de proyectos'),
                  leading: const Icon(Icons.people_alt_outlined,
                      color: Colors.orange),
                  trailing: const Icon(Icons.navigate_next_outlined,
                      color: Colors.orange),
                  onTap: () {
                    //ABRIR OTRO SCREEN
                    final route = MaterialPageRoute(
                        builder: (context) => const RegistrarProyecto());
                    Navigator.push(context, route);
                  },
                ),
                ListTile(
                  title: const Text('Listar proyectos'),
                  subtitle: const Text('Modulo de proyectos'),
                  leading: const Icon(Icons.people_alt_outlined,
                      color: Colors.orange),
                  trailing: const Icon(Icons.navigate_next_outlined,
                      color: Colors.orange),
                  onTap: () {
                    //ABRIR OTRO SCREEN
                    final route = MaterialPageRoute(
                        builder: (context) => const ListarProyectos());
                    Navigator.push(context, route);
                  },
                ),
              ],
            ),
          ),
          Container(
            color: Colors.orange, // Color del footer
            padding: const EdgeInsets.all(20),
            child: const Row(
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
