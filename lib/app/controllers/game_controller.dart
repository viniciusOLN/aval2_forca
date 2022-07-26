import 'dart:math';
import 'package:aval2_forca/app/models/keyboard_letter.dart';
import 'package:aval2_forca/app/models/letter.dart';
import 'package:aval2_forca/app/utils/letters.dart';
import 'package:flutter/material.dart';
import '../utils/constants.dart';
import '../utils/words.dart';

class GameController {
  String currentWord = '';
  String currentTip = '';
  int currentAttempt = 0;
  int correctLetters = 0;
  List<Letter> lettersOfTheWord = [];
  List<LetterKeyboard> gameKeyboard = [];
  List<String> selectedLetters = [];
  int maxGuesses = 6;
  int limitTip = 4;
  Color colorCorrectAnswer = kColorCorrectAnswer;
  Color colorWrongAnswer = kColorWrongAnswer;
  Color colorDefault = kColorDefault;

  GameController() {
    randomWord();
    gameKeyboard = lettersOfKeyboard();
  }

  void restartGame() {
    randomWord();
    currentAttempt = 0;
    correctLetters = 0;
    gameKeyboard.clear();
    selectedLetters.clear();
  }

  void randomWord() {
    int index = Random().nextInt(words.length);
    currentTip = tips[index]['tip'];
    currentWord = words[index]['word'];
    lettersOfTheWord = splitWord();
  }

  List<LetterKeyboard> lettersOfKeyboard() {
    return List.generate(
      letters.length,
      (index) => LetterKeyboard(
        letters[index],
        index,
        colorDefault,
        true,
      ),
    );
  }

  String wordWithoutSpaces() {
    return currentWord.replaceAll(' ', '');
  }

  List<Letter> splitWord() {
    List<String> listWord = removeAccent(currentWord).toUpperCase().split('');
    return List.generate(listWord.length, (index) {
      if (listWord[index] == ' ') {
        return Letter(
          ' ',
          index,
          true,
        );
      }
      return Letter(
        listWord[index],
        index,
        false,
      );
    });
  }

  void changeKeyboardLetter(String currentLetter, {Color color = Colors.red}) {
    for (var letter in gameKeyboard) {
      if (letter.letter == currentLetter &&
          letter.color != colorCorrectAnswer) {
        letter.color = color;
      }
    }
  }

  bool verifyLetter(String currentLetter) {
    return selectedLetters.contains(currentLetter)
        ? false
        : checkLetter(currentLetter);
  }

  bool checkLetter(String currentLetter) {
    bool result = false;
    selectedLetters.add(currentLetter);

    for (var letter in lettersOfTheWord) {
      if (letter.letter == currentLetter) {
        changeKeyboardLetter(currentLetter, color: colorCorrectAnswer);
        letter.isSelected = true;
        result = true;
        correctLetters++;
      }
    }

    if (!result) {
      currentAttempt++;
    }

    return result;
  }

  bool verifyGuesses() => (currentAttempt >= maxGuesses) ? true : false;

  bool checkTip() => (currentAttempt >= limitTip) ? true : false;
}
