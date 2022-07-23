import 'dart:math';
import 'package:aval2_forca/app/models/letter.dart';
import 'package:aval2_forca/app/utils/letters.dart';
import '../utils/words.dart';

class GameController {
  String currentWord = '';
  String currentTip = '';
  int currentAttempt = 0;
  List<Letter> lettersOfTheWord = [];
  List<Letter> gameKeyboard = [];
  List<String> selectedLetters = [];
  int maxGuesses = 6;
  int limitTip = 4;

  GameController() {
    randomWord();
    gameKeyboard = lettersOfKeyboard();
  }

  void randomWord() {
    int index = Random().nextInt(words.length);
    currentTip = tips[index]['tip'];
    currentWord = words[index]['word'];
    lettersOfTheWord = splitWord();
  }

  List<Letter> lettersOfKeyboard() {
    return List.generate(
      letters.length,
      (index) => Letter(
        letters[index],
        index,
        true,
      ),
    );
  }

  List<Letter> splitWord() {
    List<String> listWord =
        removeDiacritics(currentWord).toUpperCase().split('');
    return List.generate(
      listWord.length,
      (index) => Letter(
        listWord[index],
        index,
        false,
      ),
    );
  }

  void changeKeyboardLetter(String currentLetter) {
    List.generate(gameKeyboard.length, (index) {
      if (gameKeyboard[index].letter == currentLetter) {
        gameKeyboard[index].isSelected = false;
      }
    });
  }

  bool verifyLetter(String currentLetter) {
    if (selectedLetters.contains(currentLetter)) {
      changeKeyboardLetter(currentLetter);
      return false;
    }
    bool checkedLetter = checkLetter(currentLetter);
    return verifyCurrentAttempt(checkedLetter);
  }

  bool checkLetter(String currentLetter) {
    selectedLetters.add(currentLetter);
    bool result = false;

    List.generate(lettersOfTheWord.length, (index) {
      if (lettersOfTheWord[index].letter == currentLetter) {
        lettersOfTheWord[index].isSelected = true;
        result = true;
      }
    });

    return result;
  }

  bool verifyCurrentAttempt(bool result) {
    if (!result) {
      currentAttempt++;
    }
    return result;
  }

  bool verifyGuesses() => (currentAttempt >= maxGuesses) ? true : false;

  bool checkTip() => (currentAttempt == limitTip) ? true : false;
}
