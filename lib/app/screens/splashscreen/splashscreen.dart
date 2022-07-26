import 'package:aval2_forca/app/screens/homepage/homepage_screen.dart';
import 'package:flutter/material.dart';

import '../../utils/constants.dart';
import 'widgets/circular_button.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.purple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const SizedBox(height: 15),
            Text(
              "JOGO DA FORCA",
              style: kWordStyle.copyWith(color: Colors.white),
            ),
            const SizedBox(height: 30),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  "COMEÇAR",
                  style: kWordStyle.copyWith(color: Colors.white),
                ),
                const SizedBox(height: 20),
                CircularButton(
                  onTap: () {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const HomePage(),
                      ),
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
