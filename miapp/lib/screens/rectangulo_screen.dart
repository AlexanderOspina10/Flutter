import 'package:flutter/material.dart';

class RectanguloScreen extends StatefulWidget {
  const RectanguloScreen({super.key});

  @override
  State<RectanguloScreen> createState() => _RectanguloScreenState();
}

class _RectanguloScreenState extends State<RectanguloScreen> {
  //DEFINIR CONTROLADORES Y VARIABLES PARA CAPTURAR VALORES DE LAS CAJAS DE TEXTO
  TextEditingController largoController = TextEditingController();
  TextEditingController anchoController = TextEditingController();
  String resultado = '';

  //DEFINIR EL METODO
  void calcularArea() {
    try {
      double largo = double.parse(largoController.text);
      double ancho = double.parse(anchoController.text);
      double area = largo * ancho;
      setState(() {
        resultado = 'El area es: $area';
      });
    } catch (e) {
      setState(() {
        resultado = 'No se puede calcular verifique';
      });
      
    }
  }

  void calcularPerimetro() {
    try {
      double largo = double.parse(largoController.text);
      double ancho = double.parse(anchoController.text);
      double periemtro = 2 * largo + 2 * ancho;
      setState(() {
        resultado = 'El perimetro es: $periemtro';
      });
    } catch (e) {
      setState(() {
        resultado = 'No se puede calcular verifique';
      });
      
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rectangulo'),
      ),
      body: Center(
        child: Container(
          width: 500,
          height: 500,
          color: const Color.fromARGB(255, 215, 134, 12),
          child: Column(
            children: [
              TextField(
                controller: largoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Largo'),
                maxLength: 3,
              ),
              const SizedBox(
                height: 15,
              ),
              TextField(
                controller: anchoController,
                keyboardType: TextInputType.number,
                decoration: const InputDecoration(labelText: 'Ancho'),
                maxLength: 3,
              ),
              const SizedBox(height: 15,),
              ElevatedButton(onPressed: calcularArea, child: const Text('Calcular Area')),
              const SizedBox(height: 15,),const SizedBox(height: 15,),
              ElevatedButton(onPressed: calcularPerimetro, child: const Text('Calcular perimetro')),
              const SizedBox(height: 12,),
              Text('Area: $resultado')
              
            ],
          ),
        ),
      ),
    );
  }
}
