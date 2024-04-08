import 'package:flutter/material.dart';

class VotacionScreen extends StatefulWidget {
  const VotacionScreen({super.key});

  @override
  State<VotacionScreen> createState() => _VotacionScreenState();
}

int contadorVotosA = 0;
int contadorVotosB = 0;
int contadorVotosC = 0;
int contadorVotos = 0;
double porcentajeVotosA = 0;
double porcentajeVotosB = 0;
double porcentajeVotosC = 0;

class _VotacionScreenState extends State<VotacionScreen> {
  @override
  Widget build(BuildContext context) {
    // Función para calcular los porcentajes
    void calcularPorcentajes() {
      porcentajeVotosA = (contadorVotosA / contadorVotos) * 100;
      porcentajeVotosB = (contadorVotosB / contadorVotos) * 100;
      porcentajeVotosC = (contadorVotosC / contadorVotos) * 100;
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Número de votos $contadorVotos'),
        backgroundColor: const Color.fromARGB(255, 30, 135, 255),
      ),
      body: const Center(
        child: Text(
          '',
        ),
      ),
      floatingActionButton: Center(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: FloatingActionButton(
                    onPressed: () {
                      contadorVotosA++;
                      contadorVotos++;
                      calcularPorcentajes(); // Llama a la función para actualizar los porcentajes
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'CANDIDATO A\número de votos A: $contadorVotosC - Porcentaje de votos A: ${porcentajeVotosA.toStringAsFixed(2)}%\n'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: FloatingActionButton(
                    onPressed: () {
                      contadorVotosB++;
                      contadorVotos++;
                      calcularPorcentajes(); // Llama a la función para actualizar los porcentajes
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'CANDIDATO C\número de votos B: $contadorVotosB - Porcentaje de votos B: ${porcentajeVotosB.toStringAsFixed(2)}%\n'),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(30.0),
                child: SizedBox(
                  width: 200,
                  height: 200,
                  child: FloatingActionButton(
                    onPressed: () {
                      contadorVotosC++;
                      contadorVotos++;
                      calcularPorcentajes(); // Llama a la función para actualizar los porcentajes
                      setState(() {});
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                          'CANDIDATO C\número de votos C: $contadorVotosC - Porcentaje de votos C: ${porcentajeVotosC.toStringAsFixed(2)}%\n'),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
     ),
     );
     }
}