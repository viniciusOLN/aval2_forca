import 'package:aval2_forca/app/controllers/game_controller.dart';
import 'package:aval2_forca/app/screens/homepage/widgets/image.dart';
import 'package:aval2_forca/app/screens/homepage/widgets/keyboard.dart';
import 'package:aval2_forca/app/screens/resultpage/resultpage.dart';
import 'package:aval2_forca/app/utils/letters.dart';
import 'package:flutter/material.dart';
import '../../models/letter.dart';
import 'widgets/current_word.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GameController controller = GameController();

  bool _verifyLetter(String currentLetter) {
    if (controller.verifyLetter(currentLetter)) {
      setState(() {
        controller.lettersOfTheWord;
      });
      return true;
    }
    setState(() {
      controller.currentAttempt;
    });
    return false;
  }

  void _redirectResult() {
    if (controller.verifyGuesses() ||
        controller.correctLetters == controller.currentWord.length) {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(
          builder: (_) {
            return ResultPage(controller: controller);
          },
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    List<Letter> lettersWord = controller.lettersOfTheWord;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Forca'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          controller.checkTip() ? Text(controller.currentTip) : const Text(' '),
          ImageWidget(url: 'images/image_${controller.currentAttempt}.png'),
          Word(lettersWord: lettersWord),
          Keyboard(
            letters: letters,
            gameKeyboard: controller.gameKeyboard,
            onPressed: (index) {
              String snackbarText = '';
              setState(() {
                controller.changeKeyboardLetter(letters[index]);
              });

              bool checkLetter = _verifyLetter(letters[index]);

              if (checkLetter) {
                snackbarText = 'Letra correta!';
              } else {
                snackbarText = 'Letra errada!';
              }

              final snackBar = SnackBar(
                duration: const Duration(milliseconds: 500),
                content: Text(snackbarText),
              );

              if (controller.gameKeyboard[index].showSnackbar) {
                ScaffoldMessenger.of(context).showSnackBar(snackBar);
                controller.gameKeyboard[index].showSnackbar = false;
              }

              _redirectResult();
            },
          ),
          const Text(
            "Vinicius Oliveira do Nascimento, Marcos Vinícius dos Santos Dantas",
          ),
        ],
      ),
    );
  }
}
