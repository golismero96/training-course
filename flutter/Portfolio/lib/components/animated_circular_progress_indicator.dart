import 'package:Portfolio/constants.dart';
import 'package:flutter/material.dart';

class AnimatedCircularProgressIndicator extends StatelessWidget {
  const AnimatedCircularProgressIndicator({Key? key, required this.percentage, required this.label}) : super(key: key);

  final double percentage;
  final String label;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AspectRatio(
          aspectRatio: 1,
          child: TweenAnimationBuilder(
            tween: Tween<double>(begin: 0, end: percentage),
            duration: defaultDuration,
            builder: (context, double value, child) =>
                Stack(
                  fit: StackFit.expand,
                  children: [
                    CircularProgressIndicator(
                      value: value,
                      color: primaryColor,
                      backgroundColor: darkColor,
                    ),
                    Center(
                        child: Text(
                            (value * 100).ceil().toString() + '%',
                            style: Theme.of(context).textTheme.subtitle1
                        )
                    ),
                  ],
                ),
          ),
        ),
        const SizedBox(height: defaultPadding / 2),
        Text(
            label,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.subtitle2),
      ],
    );
  }
}
