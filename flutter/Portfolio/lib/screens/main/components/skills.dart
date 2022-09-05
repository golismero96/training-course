import 'package:Portfolio/components/animated_circular_progress_indicator.dart';
import 'package:Portfolio/constants.dart';
import 'package:flutter/material.dart';

class Skills extends StatelessWidget {
  const Skills({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Divider(),
        Padding(
          padding: const EdgeInsets.symmetric(vertical: defaultPadding),
          child: Text("Skills", style: Theme.of(context).textTheme.subtitle2),
        ),
        Row(
          children: const [
            Expanded(child: AnimatedCircularProgressIndicator(percentage: 0.85, label: 'React',)),
            Expanded(child: AnimatedCircularProgressIndicator(percentage: 0.25, label: 'Flutter',)),
            Expanded(child: AnimatedCircularProgressIndicator(percentage: 0.6, label: 'Django',))
          ],
        )
      ],
    );
  }
}
