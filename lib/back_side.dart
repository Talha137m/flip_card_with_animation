import 'package:flutter/material.dart';

class BackCard extends StatelessWidget {
  final double width;
  final double height;
  const BackCard({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
          image:
              DecorationImage(image: AssetImage('assets/images/backImg.jpeg'))),
    );
  }
}
