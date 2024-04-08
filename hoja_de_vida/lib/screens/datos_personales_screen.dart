import 'package:flutter/material.dart';

class DatosPersonalesScreen extends StatefulWidget {
  const DatosPersonalesScreen({super.key});

  @override
  State<DatosPersonalesScreen> createState() => _DatosPersonalesScreenState();
}

class _DatosPersonalesScreenState extends State<DatosPersonalesScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Datos personales'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: ListView(
        children: const [
          ListTile(
            title: Text('Nombre'),
            leading: Icon(Icons.info_outline,color: Colors.lightBlueAccent, size: 50,),
            subtitle: Text('Sebastian Giraldo Lopez'),
          ),
          ListTile(
            title: Text('Cedula'),
            leading: Icon(Icons.document_scanner,color: Colors.lightBlueAccent, size: 50,),
            subtitle: Text('9382647810'),
          ),
          ListTile(
            title: Text('Fecha Nacimiento'),
            leading: Icon(Icons.calendar_month,color: Colors.lightBlueAccent, size: 50,),
            subtitle: Text('15/11/2001'),
          ),
          ListTile(
            title: Text('Dirrecion'),
            leading: Icon(Icons.location_on_sharp,color: Colors.lightBlueAccent, size: 50,),
            subtitle: Text('Calle 10 #34-120'),
          ),
          ListTile(
            title: Text('Telefono'),
            leading: Icon(Icons.phone_android_sharp,color: Colors.lightBlueAccent, size: 50,),
            subtitle: Text('3015174153'),
          ),
        ]
      )
    );
  }
}

