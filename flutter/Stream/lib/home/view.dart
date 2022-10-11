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
  TextEditingController textEditingController = TextEditingController();

  final textStyle = const TextStyle(fontSize: 50, color: Colors.white);
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
      appBar: AppBar(
        title: Text('MrBug'),
        elevation: 2,
        actions: <Widget>[
          PopupMenuButton<String>(
              itemBuilder: (BuildContext context){
                return {'Setting', 'Profile', 'Logout'}.map((String Choice) {
                  return PopupMenuItem(
                    value: Choice,
                    child: Text(Choice),
                  );
                }).toList();
              } 
          )
        ],
      ),
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [Colors.blue, Colors.white],
          ),
        ),
        child: Column(
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
            Padding(
                padding: const EdgeInsets.all(10),
              child: Row(
                children: [
                  ElevatedButton(
                      onPressed: (){
                        print(textEditingController.text);
                      },
                      child: Text('find')
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                      child: TextField(
                        controller: textEditingController,
                        decoration: const InputDecoration(
                          hintText: 'Enter a city name',
                          border: UnderlineInputBorder()
                        ),
                      )
                  )
                ],
              ),
            )
          ],
        ),
      )
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
