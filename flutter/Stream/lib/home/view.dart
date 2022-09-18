import 'dart:async';
import 'dart:math';

import 'package:flutter/material.dart';

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _State();
}

class _State extends State<HomeView> {

  final StreamController<int> streamController = StreamController<int>();
  int? _randomValue;
  final Random randomNumber = Random(2);

  final textStyle = const TextStyle(fontSize: 50, color: Colors.blueGrey);
  final buttonStyle = const TextStyle(fontSize: 36, color: Colors.black);

  @override
  void initState() {
    streamController.stream.listen((event) {
      setState(() {
        _randomValue = event;
      });
    });
    super.initState();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Text(_randomValue?.toString() ?? '', style: textStyle),
          Padding(
              padding: const EdgeInsets.only(top: 50),
              child: Center(
                child: TextButton(
                    onPressed: () {
                      getRandomValue().listen((event) {
                        streamController.sink.add(event);
                      });
                    },
                    child: Text('ADD DATA', style: buttonStyle)
                ),
              )),
        ],
      ),
    );
  }
  Stream<int> getRandomValue() async* {
    int count = 0;
    while(count <= 10) {
      await Future.delayed(const Duration(seconds: 2));
      yield randomNumber.nextInt(100);
      count++;
    }
  }
}
