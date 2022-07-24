import 'package:flutter/material.dart';

class ImageWidget extends StatelessWidget {
  String url;
  ImageWidget({
    Key? key,
    required this.url,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 150,
      child: Image.asset(url),
    );
  }
}
