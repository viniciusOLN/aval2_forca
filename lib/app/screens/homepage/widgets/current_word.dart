import 'package:flutter/material.dart';

import '../../../models/letter.dart';

class Word extends StatelessWidget {
  List<Letter> lettersWord;
  Word({
    Key? key,
    required this.lettersWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(
        lettersWord.length,
        (index) {
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
        },
      ),
    );
  }
}
