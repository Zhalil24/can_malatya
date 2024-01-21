import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class WavyText extends StatelessWidget {
  const WavyText({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return AnimatedTextKit(
      repeatForever: true,
      animatedTexts: [
        WavyAnimatedText(title, textStyle: Theme.of(context).textTheme.titleLarge),
      ],
    );
  }
}
