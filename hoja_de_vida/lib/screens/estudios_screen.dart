import 'package:flutter/material.dart';

class EstudiosScreen extends StatefulWidget {
  const EstudiosScreen({super.key});

  @override
  State<EstudiosScreen> createState() => _EstudiosScreenState();
}

class _EstudiosScreenState extends State<EstudiosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Estudios'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('JavaScript'),
            leading: Icon(Icons.javascript,color: Colors.lightBlueAccent, size: 50,),
            subtitle: Text('JavaScript es un lenguaje de programación interpretado, dialecto del estándar ECMAScript. Se define como orientado a objetos, ​ basado en prototipos, imperativo, débilmente tipado y dinámico.'),
            
          ),
          ListTile(
            title: Text('Node.JS'),
            leading: Icon(Icons.format_align_justify_sharp,color: Colors.lightBlueAccent, size: 50,),
            subtitle: Text('Node.js es un entorno en tiempo de ejecución multiplataforma, de código abierto, para la capa del servidor basado en el lenguaje de programación JavaScript, asíncrono, con E/S de datos en una arquitectura orientada a eventos y basado en el motor V8 de Google.'),
          ),
          ListTile(
            title: Text('Mongo DB'),
            leading: Icon(Icons.data_array,color: Colors.lightBlueAccent, size: 50,),
            subtitle: Text('MongoDB es un sistema de base de datos NoSQL, orientado a documentos y de código abierto. En lugar de guardar los datos en tablas, tal y como se hace en las bases de datos relacionales.'),
          ),
          ListTile(
            title: Text('Python'),
            leading: Icon(Icons.psychology_alt_rounded,color: Colors.lightBlueAccent, size: 50,),
            subtitle: Text('Python es un lenguaje de alto nivel de programación interpretado cuya filosofía hace hincapié en la legibilidad de su código, se utiliza para desarrollar aplicaciones de todo tipo, por ejemplo: Instagram, Netflix, Spotify, Panda3D, entre otros.​'),
          ),
        ]
        
      )
    );
  }
}