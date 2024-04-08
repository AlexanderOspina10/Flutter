import 'package:flutter/material.dart';
import 'listar_exportaciones.dart';
import 'registar.dart';

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
          'Exportaciones',
          style: TextStyle(color: Colors.white, fontSize: 30),
        ),
        backgroundColor: Colors.orange,
      ),
      body: ListView(
        children: [
          ListTile(
            title: const Text('Crear'),
            leading: const Icon(
              Icons.arrow_right_outlined,
              color: Colors.orange,
            ),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              final route =
                  MaterialPageRoute(builder: (context) => const Registrar());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            title: const Text('Visualizar'),
            leading: const Icon(
              Icons.arrow_right_outlined,
              color: Colors.orange,
            ),
            trailing: const Icon(Icons.navigate_next),
            onTap: () {
              final route = MaterialPageRoute(
                  builder: (context) => const ListarExportaciones());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
    );
  }
}
