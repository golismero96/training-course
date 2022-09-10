import 'package:Portfolio/constants.dart';
import 'package:Portfolio/screens/main/components/flutter_coded_text.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class MyBuildAnimatedText extends StatelessWidget {
  const MyBuildAnimatedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DefaultTextStyle(
        style: Theme.of(context).textTheme.subtitle1!,
        child: Row(
          children: [
            FlutterCodedText(),
            const SizedBox(width: defaultPadding / 2),
            const Text("I build "),
            AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('Responsive web and mobile app design',
                    speed: Duration(milliseconds: 60),
                  ),
                  TyperAnimatedText('Complete e-Commerce app UI',
                    speed: Duration(milliseconds: 60),
                  ),
                  TyperAnimatedText('Chat app with dark and light theme',
                    speed: Duration(milliseconds: 60),
                  ),
                  // TypewriterAnimatedText("I'm a Flutter Developer",
                  //   speed: Duration(milliseconds: 60),
                  // ),
                ]
            ),
            const SizedBox(width: defaultPadding / 2),
            FlutterCodedText(),
          ],
        ),
      );
  }
}
