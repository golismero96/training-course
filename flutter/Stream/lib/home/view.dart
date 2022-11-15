import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';

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
    // streamController.stream.listen((event) {
    //   setState(() {
    //     _randomValue = event;
    //   });
    // });
    super.initState();
    SendRequestCurrentWeather();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('MrBug'),
        elevation: 15,
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
      body: SafeArea(
        child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(
                    image: DecorationImage(
                      alignment: Alignment.center,
                        fit: BoxFit.cover,
                        image: AssetImage('images/background.jpg')
                    )
                ),
                width: double.infinity,
                // color: Colors.black,
                // decoration: const BoxDecoration(
                //   gradient: LinearGradient(
                //     begin: Alignment.topCenter,
                //     end: Alignment.bottomCenter,
                //     colors: [Colors.black, Colors.white],
                //   ),
                // ),
                child: BackdropFilter(
                  filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(10),
                        child: Row(
                          children: [
                            ElevatedButton(
                                onPressed: (){
                                  print(textEditingController.text);
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.transparent,
                                    shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(8.0),
                                        )
                                ),
                                child: const Text('find', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                            ),
                            const SizedBox(width: 10,),
                            Expanded(
                                child: TextField(
                                  controller: textEditingController,
                                  decoration: const InputDecoration(
                                      labelStyle: TextStyle(color: Colors.white),
                                      hintStyle: TextStyle(color: Colors.white),
                                      hintText: 'Enter a city name',
                                      border: UnderlineInputBorder()
                                  ),
                                )
                            )
                          ],
                        ),
                      ),
                      // Text(_randomValue?.toString() ?? '', style: textStyle),
                      Padding(
                          padding: const EdgeInsets.only(top: 5),
                          child: Center(
                            child: TextButton(
                                onPressed: () {
                                  getRandomValue().listen((event) {
                                    streamController.sink.add(event);
                                  });
                                },
                                child: Text('Mountain View', style: TextStyle(color: Colors.white, fontSize: 26))
                            ),
                          )
                      ),
                      const Padding(
                          padding: EdgeInsets.only(top: 8),
                          child: Text('Clear Sky', style: TextStyle(color: Colors.grey, fontSize: 16))
                      ),
                      const Padding(
                          padding: EdgeInsets.only(top: 15),
                          child: Icon(Icons.wb_sunny_outlined, color: Colors.yellow, size: 60)
                      ),
                      Padding(
                          padding: EdgeInsets.only(top: 10),
                          child: Text(makeRandomNumber() + '\u00B0', style: TextStyle(color: Colors.white, fontSize: 55))
                      ),
                      const SizedBox(height: 10,),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Column(
                            children:  [
                              Text('max', style: TextStyle(color: Colors.grey.shade500, fontSize: 15)),
                              Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text('16' + '\u00B0', style: TextStyle(color: Colors.grey.shade300, fontSize: 16))
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
                              Text('max', style: TextStyle(color: Colors.grey.shade500, fontSize: 15)),
                              Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Text('12' + '\u00B0', style: TextStyle(color: Colors.grey.shade300, fontSize: 16))
                              )
                            ],
                          )
                        ],
                      ),
                      const SizedBox(height: 20,),
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
                                        elevation: 0,
                                        color: Colors.transparent,
                                        child: Column(
                                          children: [
                                            const Text('Fri, 8pm', style: TextStyle(color: Colors.white, fontSize: 12)),
                                            const SizedBox(height: 10,),
                                            Icon(pos % 2 == 0 ? Icons.wb_cloudy_outlined : Icons.cloudy_snowing, color: Colors.white, size: 28),
                                            const SizedBox(height: 7,),
                                            Text('${makeRandomNumber()}\u00B0', style: TextStyle(color: Colors.white, fontSize: 18))
                                          ],
                                        ),
                                      ),
                                    );
                                  }
                              ),
                            ),
                          )
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 25),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Column(
                              children: [
                                Text('Wind speed', style: TextStyle(color: Colors.grey.shade300, fontSize: 15, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10,),
                                const Text('4.73 m/s', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                width: 1.4,
                                height: 30,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            Column(
                              children: [
                                Text('Sunrise', style: TextStyle(color: Colors.grey.shade300, fontSize: 15, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10,),
                                const Text('6:19 PM', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                width: 1.4,
                                height: 30,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            Column(
                              children: [
                                Text('Sunset', style: TextStyle(color: Colors.grey.shade300, fontSize: 15, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10,),
                                const Text('9:3 PM', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: 15),
                              child: Container(
                                width: 1.4,
                                height: 30,
                                color: Colors.grey.shade400,
                              ),
                            ),
                            Column(
                              children: [
                                Text('Humidity', style: TextStyle(color: Colors.grey.shade300, fontSize: 15, fontWeight: FontWeight.bold)),
                                const SizedBox(height: 10,),
                                const Text('72%', style: TextStyle(color: Colors.white)),
                              ],
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ]
        ),
      ),
    );
  }

  Future<void> SendRequestCurrentWeather() async {
    var API_key = '89bcba8c6272afacbe9318d9958d2616';
    var city_name = 'tehran';
    try {
      var response = await Dio().get('https://api.openweathermap.org/data/2.5/weather?q=${city_name}&appid=${API_key}&units=metric');
      print(response.data);
      print('status code:  ${response.statusCode}');
    } catch (e) {
      print(e);
    }
  }

  String makeRandomNumber() {
    var random = randomNumber.nextInt(45);
    return random.toString();
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
