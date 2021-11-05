import 'package:flutter/material.dart';
import 'package:simple_animations/simple_animations.dart';

enum AnimationType { opacity, translateY, translateX }

class FadeAnimation extends StatelessWidget {
  final double delay;
  final Widget child;
  final String direction;

  const FadeAnimation({Key? key, required this.delay, required this.child, required this.direction}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var tween = MultiTween<AnimationType>();
    tween.add(
      AnimationType.opacity,
      Tween(begin: 0.0, end: 1.0),
      const Duration(milliseconds: 200),
    );
    if (direction == 'down') {
      tween.add(
        AnimationType.translateY,
        Tween(begin: -130.0, end: 0.0),
        const Duration(milliseconds: 1000),
        Curves.easeOut,
      );
    } else if (direction == 'up') {
      tween.add(
        AnimationType.translateY,
        Tween(begin: 130.0, end: 0.0),
        const Duration(milliseconds: 1000),
        Curves.easeOut,
      );
    }

    return PlayAnimation<MultiTweenValues<AnimationType>>(
      delay: Duration(milliseconds: (1000 * delay).round()),
      duration: tween.duration,
      tween: tween,
      child: child,
      builder: (context, child, value) => Opacity(
        opacity: value.get(AnimationType.opacity),
        child: Transform.translate(
          offset: Offset(
            0,
            value.get(AnimationType.translateY),
          ),
          child: child,
        ),
      ),
    );
  }
}
