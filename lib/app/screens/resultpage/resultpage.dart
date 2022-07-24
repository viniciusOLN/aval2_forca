import 'package:flutter/material.dart';

import '../../controllers/game_controller.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  GameController controller;
  ResultPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado da Partida'),
      ),
      body: Column(
        children: [
          controller.correctLetters == controller.currentWord.length
              ? const Text("Você ganhou!")
              : const Text('O dispositivo ganhou'),
          Text("A palavra era: ${controller.currentWord}"),
          Text("Dica: ${controller.currentTip}"),
          Text("Estatísticas"),
          Text(
              "Quantidade de tentativas: ${controller.currentAttempt + controller.correctLetters}, Letras acertadas: ${controller.correctLetters}, Letras selecionadas: ${controller.selectedLetters.length}"),
          ElevatedButton(
            onPressed: () {
              controller.restartGame();
              Navigator.pushReplacementNamed(context, '/home');
            },
            child: const Text('Reiniciar'),
          ),
        ],
      ),
    );
  }
}
