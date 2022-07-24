import 'package:flutter/material.dart';

class LetterKeyboard {
  String letter;
  int position;
  bool isSelected;
  bool showSnackbar;
  Color color;

  LetterKeyboard(this.letter, this.position, this.isSelected, this.color,
      this.showSnackbar);
}
