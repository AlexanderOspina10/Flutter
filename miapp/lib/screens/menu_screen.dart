import 'package:flutter/material.dart';
import 'package:miapp/screens/array_screen.dart';
import 'package:miapp/screens/mapas_screen.dart';
import 'package:miapp/screens/mision_screen.dart';
import 'package:miapp/screens/productos_screen.dart';
import 'package:miapp/screens/rectangulo_screen.dart';

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
              //ABRIR OTRO SCREEN
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
              //ABRIR OTRO SCREEN
              final route = MaterialPageRoute(
                  builder: (context) => const ProductosScreen());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            title: const Text('Contacto'),
            subtitle: const Text('¿Donde estamos?'),
            leading:
                const Icon(Icons.contact_mail_outlined, color: Colors.teal),
            trailing:
                const Icon(Icons.navigate_next_outlined, color: Colors.teal),
            onTap: () {
              //ABRIR OTRO SCREEN
              final route =
                  MaterialPageRoute(builder: (context) => const MisionScreen());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            title: const Text('Array'),
            subtitle: const Text('Listar datos Array'),
            leading:
                const Icon(Icons.list_alt_rounded, color: Colors.teal),
            trailing:
                const Icon(Icons.navigate_next_outlined, color: Colors.teal),
            onTap: () {
              //ABRIR OTRO SCREEN
              final route =
                  MaterialPageRoute(builder: (context) => const ScreenArray());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            title: const Text('Mapa'),
            subtitle: const Text('Listar datos Mapa'),
            leading:
                const Icon(Icons.maps_ugc_sharp, color: Colors.teal),
            trailing:
                const Icon(Icons.navigate_next_outlined, color: Colors.teal),
            onTap: () {
              //ABRIR OTRO SCREEN
              final route =
                  MaterialPageRoute(builder: (context) => const MapasScreen());
              Navigator.push(context, route);
            },
          ),
          ListTile(
            title: const Text('Rectangulo'),
            subtitle: const Text('Area y perimetro rectangulo'),
            leading:
                const Icon(Icons.maps_ugc_sharp, color: Colors.teal),
            trailing:
                const Icon(Icons.navigate_next_outlined, color: Colors.teal),
            onTap: () {
              //ABRIR OTRO SCREEN
              final route =
                  MaterialPageRoute(builder: (context) => const RectanguloScreen());
              Navigator.push(context, route);
            },
          ),
        ],
      ),
    );
  }
}
