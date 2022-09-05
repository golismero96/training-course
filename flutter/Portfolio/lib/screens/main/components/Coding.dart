import 'package:Portfolio/components/animated_linear_progress_indicator.dart';
import 'package:Portfolio/constants.dart';
import 'package:flutter/material.dart';

class Coding extends StatelessWidget {
  const Coding({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text(
            "Coding",
            style: Theme.of(context).textTheme.subtitle2,
          ),
        ),
        const AnimatedLinearProgressIndicator(percentage: 0.7, label: "JavaScript"),
        const AnimatedLinearProgressIndicator(percentage: 0.2, label: "Dart"),
        const AnimatedLinearProgressIndicator(percentage: 0.5, label: "Python"),
        const AnimatedLinearProgressIndicator(percentage: 0.9, label: "HTML"),
        const AnimatedLinearProgressIndicator(percentage: 0.85, label: "CSS"),
      ]
    );
  }
}
