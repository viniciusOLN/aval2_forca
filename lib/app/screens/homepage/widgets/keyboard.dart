import 'package:aval2_forca/app/models/keyboard_letter.dart';
import 'package:flutter/material.dart';

class Keyboard extends StatelessWidget {
  List<String> letters;
  List<LetterKeyboard> gameKeyboard;
  Function(int index) onPressed;
  Keyboard({
    Key? key,
    required this.letters,
    required this.gameKeyboard,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          runSpacing: 10.0,
          spacing: 10.0,
          children: List.generate(
            letters.length,
            (index) => IconButton(
              onPressed: () => onPressed(index),
              icon: Text(
                gameKeyboard[index].letter,
                style: TextStyle(
                  color: gameKeyboard[index].color,
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
