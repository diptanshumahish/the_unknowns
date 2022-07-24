import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:the_unknowns/utils/theme.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    var cond = Theme.of(context).brightness;
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Center(
                child: LottieBuilder.asset(
              'assets/lottie/moon.json',
            )),
            Positioned(
                top: 0,
                right: 0,
                child: LottieBuilder.asset(
                  'assets/lottie/letter.json',
                  height: 70,
                )),
            Positioned(
                top: 20,
                left: 0,
                child: LottieBuilder.asset(
                  'assets/lottie/birds.json',
                  height: 100,
                )),
            Positioned(
                bottom: 0,
                left: 0,
                child: LottieBuilder.asset(
                  'assets/lottie/cat.json',
                  height: 120,
                )),
            Positioned(
                bottom: 40,
                right: 0,
                child: LottieBuilder.asset(
                  'assets/lottie/stare.json',
                  height: 100,
                )),
            Center(
                child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //icon
                Image.asset('assets/logoo.png',
                    height: 250,
                    color: cond == Brightness.dark
                        ? AppColors.lightText
                        : AppColors.darkText),

                //text
                BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 0.3, sigmaY: 0.3),
                  child: Text(
                    "the Unknwons",
                    style: TextStyle(
                        letterSpacing: 2,
                        fontSize: 30,
                        fontWeight: FontWeight.bold,
                        color: cond == Brightness.dark
                            ? AppColors.lightText
                            : AppColors.darkText),
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  " 'Maybe Smile a bit?' ",
                  style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: cond == Brightness.dark
                          ? AppColors.lightText.withOpacity(0.7)
                          : AppColors.darkText.withOpacity(0.8)),
                ),
                Text(
                  " 'or some smol talks?' ",
                  style: TextStyle(
                      letterSpacing: 2,
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                      color: cond == Brightness.dark
                          ? AppColors.lightText.withOpacity(0.7)
                          : AppColors.darkText.withOpacity(0.8)),
                ),
              ],
            )),
          ],
        ),
      ),
    );
  }
}
