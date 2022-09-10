import 'package:Portfolio/constants.dart';
import 'package:flutter/material.dart';

class FlutterCodedText extends StatelessWidget {
  const FlutterCodedText({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return
      Text.rich(
          TextSpan(
            text: "<",
            children: [
              TextSpan(
                text: "Flutter",
                style: TextStyle(
                  color: primaryColor,
                ),
              ),
              TextSpan(
                text: ">",
              ),
            ],
          )
      );
  }
}
