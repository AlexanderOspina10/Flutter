import 'package:flutter/material.dart';
import 'package:list_menu/screens/array_screen.dart';
import 'package:list_menu/screens/mision_screen.dart';
import 'package:list_menu/screens/productos_screen.dart';

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
            title: const Text('Misión'),
            subtitle: const Text('Quienes somos'),
            leading: const Icon(Icons.people_alt_outlined, color: Colors.teal),
            trailing:
                const Icon(Icons.navigate_next_outlined, color: Colors.teal),
            onTap: () {
              //ENRUTAR
              final route =
                  MaterialPageRoute(builder: (context) => const MisionScreen());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            title: const Text('Productos'),
            subtitle: const Text('Nuestros productos'),
            leading: const Icon(Icons.production_quantity_limits_outlined,
                color: Colors.teal),
            trailing: const Icon(
              Icons.navigate_next_outlined,
              color: Colors.teal,
            ),
            onTap: () {
              //ENRUTAR
              final route = MaterialPageRoute(
                  builder: (context) => const ProductosScreen());
              Navigator.push(context, route);
            },
          ),
          const ListTile(
            title: Text('Array'),
            subtitle: Text('¿Donde estamos?'),
            leading: Icon(Icons.contact_mail_outlined, color: Colors.teal),
            trailing: Icon(Icons.navigate_next_outlined, color: Colors.teal),
          ),
          ListTile(
            title: const Text('Array'),
            subtitle: const Text('Recorrido Array'),
            leading: const Icon(Icons.production_quantity_limits_outlined,
                color: Colors.teal),
            trailing: const Icon(
              Icons.navigate_next_outlined,
              color: Colors.teal,
            ),
            onTap: () {
              //ENRUTAR
              final route =
                  MaterialPageRoute(builder: (context) => const ArrayScreen());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
    );
  }
}

/*
Crear un mapa de 10 elementos y 3 keys.
Las keys son: refrencia, nombre, precio

Crear una screen para listar el nombre en el titulo y la referencia y precio en subtitle

Sin realizar cambios en el mapa agregar en la lista
el precio en dolares, es decir debe quedar el precio en peros y dolares.
*/
