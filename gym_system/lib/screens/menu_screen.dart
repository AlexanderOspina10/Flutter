import 'package:flutter/material.dart';
import 'package:gym_system/screens/clientes_screen.dart';

class MenuScreen extends StatefulWidget {
  const MenuScreen({super.key});

  @override
  State<MenuScreen> createState() => _MenuScreenState();
}

class _MenuScreenState extends State<MenuScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'GYM SYSTEM',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Home'),
            subtitle: Text('Inicio de la aplicación'),
            leading: Icon(
              Icons.home,
              color: Colors.orange,
            ),
            trailing: Icon(Icons.navigate_next_outlined, color: Colors.orange),
          ),
          ListTile(
            title: const Text('Clientes'),
            subtitle: const Text('Modulo de clientes'),
            leading:
                const Icon(Icons.people_alt_outlined, color: Colors.orange),
            trailing:
                const Icon(Icons.navigate_next_outlined, color: Colors.orange),
            onTap: () {
              //ABRIR OTRO SCREEN
              final route = MaterialPageRoute(
                  builder: (context) => const ClientesScreen());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
    );
  }
}
