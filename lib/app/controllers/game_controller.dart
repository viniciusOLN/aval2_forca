import 'dart:math';
import 'package:aval2_forca/app/models/letter.dart';
import 'package:flutter/material.dart';
import '../utils/words.dart';

class GameController {
  String currentWord = '';
  String currentTip = '';
  int currentAttempt = 0;
  List<Letter> lettersOfTheWord = [];

  GameController() {
    randomWord();
  }

  void randomWord() {
    int index = Random().nextInt(words.length);
    currentTip = tips[index]['tip'];
    currentWord = words[index]['word'];
    lettersOfTheWord = splitWord();
  }

  List<Letter> splitWord() {
    List<String> listWord = currentWord.toUpperCase().split('');
    return List.generate(
      listWord.length,
      (index) => Letter(
        listWord[index],
        index,
        false,
      ),
    );
  }

  bool verifyLetter(String currentLetter) {
    bool result = false;
    List.generate(lettersOfTheWord.length, (index) {
      if (lettersOfTheWord[index].letter == currentLetter) {
        lettersOfTheWord[index].isSelected = true;
        result = true;
      }
    });
    return result;
  }
}
