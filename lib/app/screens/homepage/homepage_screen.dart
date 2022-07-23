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
    List<Letter> a = controller.lettersOfTheWord;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Jogo da Forca'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Text('escolhendo palavra'),
          Text("Aqui vai a dica"),
          Container(
            height: 200,
            child: Image.asset('images/imagem_base.png'),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children:
                List.generate(controller.lettersOfTheWord.length, (index) {
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
                child: a[index].isSelected
                    ? Text(controller.currentWord[index])
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
                      if (controller.verifyLetter(letters[index])) {
                        setState(() {
                          a;
                        });
                      }
                    },
                    icon: Text(letters[index]),
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
