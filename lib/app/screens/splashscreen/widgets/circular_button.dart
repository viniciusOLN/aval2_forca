import 'package:flutter/material.dart';

class CircularButton extends StatelessWidget {
  final Function()? onTap;
  // ignore: use_key_in_widget_constructors
  const CircularButton({
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: onTap,
      child: const Padding(
        padding: EdgeInsets.all(15),
        child: const Icon(
          Icons.play_arrow,
          size: 40,
        ),
      ),
      style: ElevatedButton.styleFrom(
        shape: const CircleBorder(),
        primary: const Color.fromARGB(255, 110, 41, 122),
      ),
    );
  }
}
