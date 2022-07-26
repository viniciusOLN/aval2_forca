import 'package:flutter/material.dart';
import '../../controllers/game_controller.dart';
import '../../utils/constants.dart';

// ignore: must_be_immutable
class ResultPage extends StatelessWidget {
  GameController controller;
  ResultPage({
    Key? key,
    required this.controller,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    String winner = controller.correctLetters == controller.currentWord.length
        ? "Você ganhou!"
        : "O dispositivo ganhou";

    return Scaffold(
      appBar: AppBar(
        title: const Text('Resultado da Partida'),
      ),
      body: Center(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Text(
              winner,
              style: kWordStyle.copyWith(
                fontSize: 25,
              ),
            ),
            const SizedBox(height: 50),
            const Text("Palavra Selecionada pelo juíz", style: kWordStyle),
            const SizedBox(height: 5),
            Text(
              controller.currentWord.toUpperCase(),
              style: kWordStyle.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 50),
            const Text("Dica da Palavra", style: kWordStyle),
            const SizedBox(height: 5),
            Text(
              controller.currentTip,
              style: kWordStyle.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 60),
            const Text("ESTATÍSTICAS", style: kWordStyle),
            const SizedBox(height: 40),
            Text(
              "Quantidade de tentativas: ${controller.currentAttempt + controller.correctLetters}",
              style: kWordStyle.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Palavras corretas: ${controller.correctLetters}",
              style: kWordStyle.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 20),
            Text(
              "Letras Selecionadas",
              style: kWordStyle.copyWith(
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: List.generate(
                controller.selectedLetters.length,
                (index) => Text(
                  "${controller.selectedLetters[index]} ",
                  style: kWordStyle.copyWith(
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ),
            Expanded(
              child: Column(children: []),
            ),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 25, vertical: 10),
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  controller.restartGame();
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text('Reiniciar'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
