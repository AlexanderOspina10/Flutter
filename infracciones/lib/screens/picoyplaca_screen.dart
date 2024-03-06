import 'package:flutter/material.dart';

class PicoyplacaScreen extends StatefulWidget {
  const PicoyplacaScreen({super.key});

  @override
  State<PicoyplacaScreen> createState() => _PicoyplacaScreenState();
}

class _PicoyplacaScreenState extends State<PicoyplacaScreen> {
  // ignore: non_constant_identifier_names
  TextEditingController PicoyplacaController = TextEditingController();
  int placa = 0;
  String resultado = '';
  String mostrar = '';

  // ignore: non_constant_identifier_names
  void ValidarDia() {
    try {
      placa = int.parse(PicoyplacaController.text);
      if (placa == 1 || placa == 0) {
        resultado = 'el lunes';
      } else if (placa == 2 || placa == 3) {
        resultado = 'el martes';
      } else if (placa == 4 || placa == 5) {
        resultado = 'el miercoles';
      } else if (placa == 6 || placa == 7) {
        resultado = 'el jueves';
      } else if (placa == 8 || placa == 9) {
        resultado = 'el viernes';
      }
      setState(() {
        mostrar = 'Hola,$resultado';
      });
    } catch (e) {
      setState(() {
        mostrar = 'Placa no valida para el calculo';
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Validar pico y placa'),
      ),
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          color: const Color.fromARGB(255, 215, 134, 12),
          child: Column(
            children: [
              TextField(
                controller: PicoyplacaController,
                keyboardType: TextInputType.number,
                decoration:
                    const InputDecoration(labelText: 'Ingrese su placa'),
                maxLength: 1,
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                  onPressed: ValidarDia, child: const Text('Validar dia')),
              Text('Su dia es: $resultado')
            ],
          ),
        ),
      ),
    );
  }
}
