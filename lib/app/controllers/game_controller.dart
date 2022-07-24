import 'dart:math';
import 'package:aval2_forca/app/models/keyboard_letter.dart';
import 'package:aval2_forca/app/models/letter.dart';
import 'package:aval2_forca/app/utils/letters.dart';
import 'package:flutter/material.dart';
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
  int controlSnackbar = 0;
  Color colorCorrectAnswer = Colors.yellow;
  Color colorWrongAnswer = Colors.red;
  Color colorDefault = Colors.blue;

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
        true,
        colorDefault,
        true,
      ),
    );
  }

  List<Letter> splitWord() {
    List<String> listWord = removeAccent(currentWord).toUpperCase().split('');

    return List.generate(
      listWord.length,
      (index) => Letter(
        listWord[index],
        index,
        false,
      ),
    );
  }

  void changeKeyboardLetter(String currentLetter, {Color color = Colors.red}) {
    List.generate(gameKeyboard.length, (index) {
      if (gameKeyboard[index].letter == currentLetter &&
          gameKeyboard[index].color != colorCorrectAnswer) {
        gameKeyboard[index].isSelected = false;
        gameKeyboard[index].color = color;
      }
    });
  }

  bool verifyLetter(String currentLetter) {
    if (selectedLetters.contains(currentLetter)) {
      changeKeyboardLetter(currentLetter, color: colorWrongAnswer);
      return false;
    }

    return checkLetter(currentLetter);
  }

  bool checkLetter(String currentLetter) {
    bool result = false;
    selectedLetters.add(currentLetter);

    List.generate(lettersOfTheWord.length, (index) {
      if (lettersOfTheWord[index].letter == currentLetter) {
        lettersOfTheWord[index].isSelected = true;
        changeKeyboardLetter(currentLetter, color: colorCorrectAnswer);
        correctLetters++;
        result = true;
      }
    });

    if (!result) {
      currentAttempt++;
    }

    return result;
  }

  bool selectedLetter(String currentLetter) =>
      selectedLetters.contains(currentLetter) ? true : false;

  bool verifyGuesses() => (currentAttempt >= maxGuesses) ? true : false;

  bool checkTip() => (currentAttempt >= limitTip) ? true : false;
}
