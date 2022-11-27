import 'dart:math';

import 'package:flip_card_animation/back_side.dart';
import 'package:flip_card_animation/front_card.dart';
import 'package:flutter/material.dart';

class FlipCardAnimation extends StatefulWidget {
  const FlipCardAnimation({super.key});

  @override
  State<FlipCardAnimation> createState() => _FlipCardAnimationState();
}

class _FlipCardAnimationState extends State<FlipCardAnimation>
    with SingleTickerProviderStateMixin {
  final angle = 0.2 * -pi;
  late bool isFront;

  late Animation _animation;
  late AnimationController _animationController;
  @override
  void initState() {
    super.initState();
    Tween tween = Tween<double>(begin: 0, end: pi);
    isFront = true;
    _animationController =
        AnimationController(vsync: this, duration: const Duration(seconds: 1));
    _animation = tween.animate(
        CurvedAnimation(parent: _animationController, curve: Curves.easeIn));
    _animationController.addListener(() {
      setState(() {});
    });
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;
    var width = screenSize.width;
    var height = screenSize.height;
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            GestureDetector(
              onTap: () {
                setState(() {
                  isFront = isFront == true ? false : true;
                });
                _animationController.forward();
                _animationController.addStatusListener((status) {
                  if (status == AnimationStatus.completed) {
                    _animationController.reset();
                  }
                });
              },
              child: AnimatedSwitcher(
                duration: const Duration(seconds: 1),
                transitionBuilder: ((child, animation) {
                  return Transform(
                    transform: Matrix4.rotationY(_animation.value)
                      ..setEntry(3, 2, 1),
                    alignment: Alignment.center,
                    child: child,
                  );
                }),
                child: isFront == true
                    ? FrontCard(
                        width: width * 0.5,
                        height: height * 0.6,
                      )
                    : BackCard(
                        width: width * 0.5,
                        height: height * 0.6,
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
