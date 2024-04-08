import 'dart:convert';

import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;

//https://www.datos.gov.co/resource/vcjz-niiq.json

class Hurtos {
  // ignore: non_constant_identifier_names
  final String municipio; //final que en tiempo de ejecucion no cambia
  // ignore: non_constant_identifier_names
  final String armas_medios;

  Hurtos(
      // ignore: non_constant_identifier_names
      {required this.municipio,
      // ignore: non_constant_identifier_names
      required this.armas_medios});

  factory Hurtos.fromJson(Map<String, dynamic> json) {
    return Hurtos(
        municipio: json['municipio'], armas_medios: json['armas_medios']);
  }
}

//Incorporar Future para traer la api
Future<List<Hurtos>> fetchPosts() async {
  final response = await http.get(Uri.parse(
      'https://www.datos.gov.co/resource/9vha-vh9n.json?departamento=ANTIOQUIA&armas_medios=ARMA%20DE%20FUEGO&municipio=MEDELL%C3%8DN%20(CT)'));

  if (response.statusCode == 200) {
    List<dynamic> data = json.decode(response.body);
    return data.map((json) => Hurtos.fromJson(json)).toList();
  } else {
    throw Exception('Fallo al cargar los Hurtos');
  }
}

class ListarHurtos extends StatefulWidget {
  const ListarHurtos({super.key});

  @override
  State<ListarHurtos> createState() => _ListarHurtosState();
}

class _ListarHurtosState extends State<ListarHurtos> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Hurtos'),
      ),
      body: FutureBuilder(
          future: fetchPosts(),
          builder: (context, snapshot) {
            //Verificar si hay espera
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                  child:
                      CircularProgressIndicator()); // Retorna un circulo de progreso
            } else if (snapshot.hasError) {
              return (Text('Error: ${snapshot.error}'));
            } else {
              List<Hurtos> municipio = snapshot.data as List<Hurtos>;
              return ListView.builder(
                itemCount: municipio.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(municipio[index].municipio),
                    subtitle: Text(municipio[index].armas_medios),
                  );
                },
              );
            }
          }),
    );
  }
}
