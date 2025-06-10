import 'package:flutter/material.dart';

class Imcscreen extends StatelessWidget {
  final double height;
  final double weight;

  const Imcscreen({super.key, required this.weight, required this.height});

  @override
  Widget build(BuildContext context) {
    final double imc = weight / (height * height);
    final result = _calculate(imc);

    return Scaffold(
      appBar: AppBar(title: const Text('IMC - Resultado')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'Resultado do IMC: ${imc.toStringAsPrecision(3)}',
              style: const TextStyle(fontSize: 24),
            ),
            const SizedBox(height: 20),
            Text(result['mensagem']!, style: const TextStyle(fontSize: 20)),
            const SizedBox(height: 20),
            Image.asset(result['imagem']!, width: 150, height: 150),
          ],
        ),
      ),
    );
  }

  Map<String, String> _calculate(double imc) {
    String mensagem;
    String imagem;

    if (imc < 18.5) {
      mensagem = 'Abaixo do peso (${imc.toStringAsPrecision(3)})';
      imagem = 'assets/magro.jpeg';
    } else if (imc < 25) {
      mensagem = 'Peso normal (${imc.toStringAsPrecision(3)})';
      imagem = 'assets/normal.jpeg';
    } else if (imc < 30) {
      mensagem = 'Sobrepeso (${imc.toStringAsPrecision(3)})';
      imagem = 'assets/gordo.jpeg';
    } else if (imc < 35) {
      mensagem = 'Obesidade Grau I (${imc.toStringAsPrecision(3)})';
      imagem = 'assets/gordo.jpeg';
    } else if (imc < 40) {
      mensagem = 'Obesidade Grau II (${imc.toStringAsPrecision(3)})';
      imagem = 'assets/gordo.jpeg';
    } else if (imc >= 40) {
      mensagem = 'Obesidade Grau III (${imc.toStringAsPrecision(3)})';
      imagem = 'assets/gordo.jpeg';
    } else {
      mensagem = 'IMC inválido';
      imagem = 'assets/erro.jpeg';
    }

    return {'mensagem': mensagem, 'imagem': imagem};
  }
}
