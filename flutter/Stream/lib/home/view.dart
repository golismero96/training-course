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
  final buttonStyle = const TextStyle(fontSize: 36, color: Colors.white);

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
        title: const Text('MrBug'),
        elevation: 2,
        backgroundColor: Colors.grey.shade900,
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
        color: Colors.black,
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topCenter,
        //     end: Alignment.bottomCenter,
        //     colors: [Colors.black, Colors.white],
        //   ),
        // ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Padding(
            //   padding: const EdgeInsets.all(10),
            //   child: Row(
            //     children: [
            //       ElevatedButton(
            //           onPressed: (){
            //             print(textEditingController.text);
            //           },
            //           child: Text('find')
            //       ),
            //       const SizedBox(width: 10,),
            //       Expanded(
            //           child: TextField(
            //             controller: textEditingController,
            //             decoration: const InputDecoration(
            //                 hintText: 'Enter a city name',
            //                 border: UnderlineInputBorder()
            //             ),
            //           )
            //       )
            //     ],
            //   ),
            // ),
            // Text(_randomValue?.toString() ?? '', style: textStyle),
            Padding(
                padding: const EdgeInsets.only(top: 50),
                child: Center(
                  child: TextButton(
                      onPressed: () {
                        getRandomValue().listen((event) {
                          streamController.sink.add(event);
                        });
                      },
                      child: Text('Mountain View', style: TextStyle(color: Colors.white, fontSize: 36))
                  ),
                )
            ),
            const Padding(
              padding: EdgeInsets.only(top: 20),
              child: Text('Clear Sky', style: TextStyle(color: Colors.grey, fontSize: 20))
            ),
            const Padding(
              padding: EdgeInsets.only(top: 30),
              child: Icon(Icons.wb_sunny_outlined, color: Colors.yellow, size: 80)
            ),
            const Padding(
              padding: EdgeInsets.only(top: 15),
              child: Text('14' + '\u00B0', style: TextStyle(color: Colors.white, fontSize: 65))
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  children:  [
                    Text('max', style: TextStyle(color: Colors.grey.shade700, fontSize: 15)),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                      child: Text('16' + '\u00B0', style: TextStyle(color: Colors.grey.shade400, fontSize: 19))
                    )
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child: Container(
                    width: 1,
                    height: 30,
                    color: Colors.grey.shade400,
                  ),
                ),
                Column(
                  children: [
                    Text('max', style: TextStyle(color: Colors.grey.shade700, fontSize: 15)),
                    Padding(
                        padding: const EdgeInsets.only(top: 10),
                        child: Text('12' + '\u00B0', style: TextStyle(color: Colors.grey.shade400, fontSize: 19))
                    )
                  ],
                )
              ],
            ),
            Padding(
              padding: const EdgeInsets.only(top: 10),
              child: Container(
                color: Colors.grey,
                height: 1,
                width: double.infinity,
              ),
            ),
            Container(
              width: double.infinity,
              height: 100,
              child: Padding(
                padding: const EdgeInsets.only(top: 10),
                child: Center(
                  child: ListView.builder(
                    shrinkWrap: true,
                    scrollDirection: Axis.horizontal,
                    itemCount: 10,
                      itemBuilder: (BuildContext context, int pos) {
                        return Container(
                          height: 50,
                          width: 70,
                          child: Card(
                            color: Colors.transparent,
                            child: Column(
                              children: [
                                Text('Fri, 8pm', style: TextStyle(color: Colors.white, fontSize: 15)),
                                Icon(Icons.wb_cloudy, color: Colors.white, size: 30),
                                Text('14' + '\u00B0', style: TextStyle(color: Colors.white, fontSize: 20))
                              ],
                            ),
                          ),
                        );
                      }
                  ),
                ),
              )
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
