import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/conistants/app_route_pathes.dart';
import '../../../../../core/conistants/constants.dart';

class AnimatedSplashText extends StatefulWidget {
  const AnimatedSplashText({
    super.key,
    required this.height,
    required this.width,
  });

  final double height;
  final double width;

  @override
  State<AnimatedSplashText> createState() => _AnimatedSplashTextState();
}

class _AnimatedSplashTextState extends State<AnimatedSplashText>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> obasityAnimation;

  @override
  void initState() {
    initAnimation();
    super.initState();
  }

  void initAnimation() {
    animationController =
        AnimationController(vsync: this, duration: kAnimationDuration);
    obasityAnimation =
        Tween<double>(begin: .2, end: 1).animate(animationController);
    animationController.forward();
    animationController.addListener(() {
      if (animationController.status.isCompleted) {
        context.go(kBooksHome);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Positioned(
        bottom: widget.height / 4,
        right: widget.width / 4,
        child: AnimatedBuilder(
            animation: animationController,
            builder: (context, _) {
              return Opacity(
                  opacity: obasityAnimation.value,
                  child: Text("Your Ultimate Reading Companion"));
            }));
  }
}
