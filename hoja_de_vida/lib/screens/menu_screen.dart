import 'package:flutter/material.dart';
import 'package:hoja_de_vida/screens/datos_personales_screen.dart';
import 'package:hoja_de_vida/screens/estudios_screen.dart';
import 'package:hoja_de_vida/screens/habilidades_screen.dart';

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
        title: const Text('Hoja de vida', style: TextStyle(color: Colors.black),),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView(
        children: [
          const ListTile(title: Text('Home'),
          subtitle: Text('Inicio de la aplicacion'),
          leading: Icon(Icons.home, color: Colors.lightBlueAccent,),
          trailing: Icon(Icons.navigate_next_outlined, color: Colors.lightBlueAccent),
          ),
          ListTile(title: const Text('Datos personales'),
          leading: const Icon(Icons.people_alt_outlined, color: Colors.lightBlueAccent),
          trailing: const Icon(Icons.navigate_next_outlined, color: Colors.lightBlueAccent),
          onTap: () { //Abrir otra Screen
            final route = MaterialPageRoute(
              builder: (context) => const DatosPersonalesScreen()
            );
            Navigator.push(context, route);
          },
          ),
          ListTile(title: const Text('Estudios'),
          leading: const Icon(Icons.people_alt_outlined, color: Colors.lightBlueAccent),
          trailing: const Icon(Icons.navigate_next_outlined, color: Colors.lightBlueAccent),
          onTap: () { //Abrir otra Screen
            final route = MaterialPageRoute(
              builder: (context) => const EstudiosScreen()
            );
            Navigator.push(context, route);
          },
          ),
          ListTile(title: const Text('Habilidades'),
          leading: const Icon(Icons.people_alt_outlined, color: Colors.lightBlueAccent),
          trailing: const Icon(Icons.navigate_next_outlined, color: Colors.lightBlueAccent),
          onTap: () { //Abrir otra Screen
            final route = MaterialPageRoute(
              builder: (context) => const HabilidadesScreen()
            );
            Navigator.push(context, route);
          },
          )
        ],
      ),
    );
  }
}