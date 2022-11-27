import 'package:flutter/material.dart';

class FrontCard extends StatelessWidget {
  final double width;
  final double height;
  const FrontCard({super.key, required this.width, required this.height});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage('assets/images/frontImg.jpeg'))),
    );
  }
}
