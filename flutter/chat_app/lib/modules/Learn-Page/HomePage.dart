// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'LearnFlutterPage.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
        child: ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (BuildContext context) => const LearnFlutterPage()));
      },
      child: const Text('Learn Flutter', style: TextStyle(color: Colors.white)),
    ));
  }
}
