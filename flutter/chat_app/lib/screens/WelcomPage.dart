// ignore_for_file: file_names

import 'package:flutter/material.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: <Widget>[
        Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage("images/sigma/14.png"),
              fit: BoxFit.cover,
            ),
          ),
        ),
        const Center(
          child: Text("Hello background"),
        )
      ],
    ));
  }
}
