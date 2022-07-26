import 'package:flutter/material.dart';
import '../../../models/letter.dart';
import '../../../utils/constants.dart';

class Word extends StatelessWidget {
  List<Letter> lettersWord;
  Word({
    Key? key,
    required this.lettersWord,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 45),
          child: Wrap(
            alignment: WrapAlignment.start,
            runAlignment: WrapAlignment.center,
            children: List.generate(
              lettersWord.length,
              (index) {
                return Container(
                  margin: const EdgeInsets.all(8),
                  width: 15,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    border: Border(
                      bottom: BorderSide(
                        color: (lettersWord[index].letter == ' ')
                            ? kSpacesColor
                            : kBorderWord,
                        width: 3,
                      ),
                    ),
                  ),
                  child: lettersWord[index].isSelected
                      ? Text(
                          lettersWord[index].letter,
                          style: kWordStyle,
                        )
                      : const Text(' '),
                );
              },
            ),
          ),
        ),
      ],
    );
  }
}
