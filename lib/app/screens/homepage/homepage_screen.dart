import 'package:aval2_forca/app/controllers/game_controller.dart';
import 'package:aval2_forca/app/utils/letters.dart';
import 'package:flutter/material.dart';
import '../../models/letter.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  GameController controller = GameController();
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
          Container(
            height: 200,
            child: Image.asset('images/image_${controller.currentAttempt}.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(lettersWord.length, (index) {
              return Container(
                margin: const EdgeInsets.all(10),
                decoration: const BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                      color: Colors.blue,
                      width: 3,
                    ),
                  ),
                ),
                child: lettersWord[index].isSelected
                    ? Text(lettersWord[index].letter)
                    : const Text(' '),
              );
            }),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Wrap(
                alignment: WrapAlignment.center,
                runSpacing: 10.0,
                spacing: 10.0,
                children: List.generate(
                  letters.length,
                  (index) => IconButton(
                    onPressed: () {
                      setState(() {
                        controller.changeKeyboardLetter(letters[index]);
                      });
                      if (controller.verifyLetter(letters[index])) {
                        setState(() {
                          lettersWord;
                        });
                      } else {
                        setState(() {
                          controller.currentAttempt;
                        });
                      }
                      if (controller.verifyGuesses()) {
                        print("perdeu");
                      }
                    },
                    icon: Text(
                      controller.gameKeyboard[index].letter,
                      style: TextStyle(
                        color: controller.gameKeyboard[index].isSelected
                            ? Colors.blue
                            : Colors.red,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
