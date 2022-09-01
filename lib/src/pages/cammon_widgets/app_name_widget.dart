import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:app_loja/src/config/app_colors.dart';
import 'package:flutter/material.dart';

// NOME DO APLICATIVO

class AppName extends StatelessWidget {
  const AppName({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        const Text.rich(TextSpan(
            style: TextStyle(
              fontSize: 40,
            ),
            children: [
              TextSpan(
                  text: 'Ateliê',
                  style: TextStyle(
                    color: AppColors.shape,
                    fontWeight: FontWeight.bold,
                  )),
              TextSpan(
                  text: 'daSil',
                  style: TextStyle(
                    color: AppColors.secondary,
                    fontWeight: FontWeight.bold,
                  ))
            ])),
        SizedBox(
          height: 30,
          child: DefaultTextStyle(
            style: const TextStyle(fontSize: 18, color: AppColors.stroke),

// Animação Tela de Login
            child: AnimatedTextKit(
                repeatForever: true,
                pause: Duration.zero,
                animatedTexts: [
                  FadeAnimatedText('Feito a mão,'),
                  FadeAnimatedText('com amor!'),
                ]),
          ),
        ),
      ],
    );
  }
}
