import 'package:aval2_forca/app/models/keyboard_letter.dart';
import 'package:flutter/material.dart';

import '../../../utils/constants.dart';

class Keyboard extends StatelessWidget {
  List<LetterKeyboard> letters;
  Function(int index) onPressed;
  Keyboard({
    Key? key,
    required this.letters,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Wrap(
          alignment: WrapAlignment.center,
          runAlignment: WrapAlignment.center,
          runSpacing: 0.0,
          spacing: 2.0,
          children: List.generate(
            letters.length,
            (index) => IconButton(
              iconSize: 30,
              onPressed: () => onPressed(index),
              icon: Container(
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: letters[index].color,
                  borderRadius: const BorderRadius.all(Radius.circular(2)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(0),
                  child: Text(
                    letters[index].letter,
                    style: TextStyle(
                      color: kKeyboardColor,
                    ),
                  ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
