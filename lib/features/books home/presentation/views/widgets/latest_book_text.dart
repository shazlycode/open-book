import 'package:flutter/material.dart';
import 'package:openbook/core/conistants/constants.dart';
import 'package:openbook/core/conistants/styles.dart';

class LatestBookText extends StatefulWidget {
  const LatestBookText({super.key});

  @override
  State<LatestBookText> createState() => _LatestBookTextState();
}

class _LatestBookTextState extends State<LatestBookText>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> animation;

  @override
  void initState() {
    animateText();
    super.initState();
  }

  void animateText() {
    animationController =
        AnimationController(vsync: this, duration: kTetAnimationDuration)
          ..repeat(reverse: true);
    animation = Tween<double>(
      begin: .0,
      end: 1,
    ).animate(animationController);
    // animationController.forward();
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: AnimatedBuilder(
          animation: animationController,
          builder: (context, _) {
            return Opacity(
                opacity: animation.value,
                child: Text(
                  "New Books",
                  style: kStyle3.copyWith(color: Colors.green),
                ));
          }),
    );
  }
}
