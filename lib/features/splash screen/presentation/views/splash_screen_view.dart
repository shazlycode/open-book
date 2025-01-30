import 'package:flutter/material.dart';

import '../../../../core/conistants/constants.dart';
import 'widgets/animated_splash_text.dart';

class SplashScreenView extends StatelessWidget {
  const SplashScreenView({super.key});

  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.of(context).size.height;
    var width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Stack(
        children: [
          Image.asset(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            kSplashScreenLogo,
            fit: BoxFit.cover,
          ),
          AnimatedSplashText(height: height, width: width),
        ],
      ),
    );
  }
}
