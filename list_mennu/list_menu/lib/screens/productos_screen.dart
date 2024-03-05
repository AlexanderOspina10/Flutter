import 'package:flutter/material.dart';

class ProductosScreen extends StatefulWidget {
  const ProductosScreen({super.key});

  @override
  State<ProductosScreen> createState() => _ProductosScreenState();
}

class _ProductosScreenState extends State<ProductosScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Productos'),
      ),
      body: const Column(
        children: [
          Row(
            children: [
              Icon(Icons.apple, size: 50, color: Colors.green),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'La manzana o poma1​ es el fruto comestible de la especie Malus domestica, el manzano común. Es una fruta pomácea de forma redonda y sabor muy dulce, dependiendo de la variedad.Los manzanos se cultivan en todo el mundo y son las especies más utilizadasdel género Malus. El árbol se originó en Asia Central, donde su ancestro salvaje, Malus sieversii, todavía se encuentra hoy en día. Las manzanas se han cultivado durante miles de años en Asia y Europa y fueron llevadas a América por colonos europeos.Las manzanas tienen un significado religioso y mitológico en muchas culturas, incluyendo la tradición nórdica, griega y cristiana europea.',
                  textAlign: TextAlign.justify,
                ),
              )) //INTERPOLAR + ALT Z PARA ACOMODAR
            ],
          ),
          Row(
            textDirection: TextDirection.rtl,
            children: [
              Icon(Icons.computer_sharp, size: 50, color: Colors.blue),
              Expanded(
                  child: Padding(
                padding: EdgeInsets.all(20.0),
                child: Text(
                  'Un  computador​ es el fruto comestible de la especie Malus domestica, el manzano común. Es una fruta pomácea de forma redonda y sabor muy dulce, dependiendo de la variedad.Los manzanos se cultivan en todo el mundo y son las especies más utilizadasdel género Malus. El árbol se originó en Asia Central, donde su ancestro salvaje, Malus sieversii, todavía se encuentra hoy en día. Las manzanas se han cultivado durante miles de años en Asia y Europa y fueron llevadas a América por colonos europeos.Las manzanas tienen un significado religioso y mitológico en muchas culturas, incluyendo la tradición nórdica, griega y cristiana europea.',
                  textAlign: TextAlign.justify,
                ),
              )) //INTERPOLAR + ALT Z PARA ACOMODAR
            ],
          ),
        ],
      ),
    );
  }
}
