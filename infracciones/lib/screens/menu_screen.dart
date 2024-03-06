import 'package:flutter/material.dart';
import 'package:infracciones/screens/infracciones_screen.dart';
import 'package:infracciones/screens/picoyplaca_screen.dart';

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
          'Mi App',
          style: TextStyle(color: Colors.black, fontSize: 30),
        ),
        backgroundColor: Colors.tealAccent,
      ),
      body: ListView(
        children: [
          const ListTile(
            title: Text('Home'),
            subtitle: Text('Inicio de la aplicación'),
            leading: Icon(
              Icons.home,
              color: Colors.teal,
            ),
            trailing: Icon(Icons.navigate_next_outlined, color: Colors.teal),
          ),
          ListTile(
            title: const Text('Pico y placa'),
            subtitle: const Text('Consulte su día'),
            leading: const Icon(Icons.car_crash, color: Colors.teal),
            trailing:
                const Icon(Icons.navigate_next_outlined, color: Colors.teal),
            onTap: () {
              //ABRIR OTRO SCREEN
              final route = MaterialPageRoute(
                  builder: (context) => const PicoyplacaScreen());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            title: const Text('Infraccion'),
            subtitle: const Text('Ingrese o consulte sus infracciones'),
            leading: const Icon(Icons.report_outlined, color: Colors.teal),
            trailing:
                const Icon(Icons.navigate_next_outlined, color: Colors.teal),
            onTap: () {
              //ABRIR OTRO SCREEN
              final route =
                  MaterialPageRoute(builder: (context) => InfraccionesScreen());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
    );
  }
}
