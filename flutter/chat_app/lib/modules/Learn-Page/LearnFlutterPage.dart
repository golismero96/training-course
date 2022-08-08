// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LearnFlutterPage extends StatefulWidget {
  const LearnFlutterPage({Key? key}) : super(key: key);

  @override
  State<LearnFlutterPage> createState() => _LearnFlutterPageState();
}

class _LearnFlutterPageState extends State<LearnFlutterPage> {
  bool isSwitch = false;
  bool? isCheckbox = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            iconTheme: const IconThemeData(color: Colors.white),
            title: const Text('Learn Flutter',
                style: TextStyle(color: Colors.white)),
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: const Icon(Icons.arrow_back_ios),
              onPressed: () {
                Navigator.of(context).pop();
              },
            ),
            actions: [
              IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {},
              ),
              IconButton(
                icon: const Icon(Icons.info_outline),
                onPressed: () {
                  showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return const AlertDialog(
                          title: Text('About'),
                          content: Text('This is the about page'),
                        );
                      });
                },
              ),
              PopupMenuButton<int>(
                itemBuilder: (context) => [
                  // popupmenu item 1
                  PopupMenuItem(
                    value: 1,
                    // row has two child icon and text.
                    child: Row(
                      children: const [
                        Icon(Icons.star),
                        SizedBox(
                          // sized box with width 10
                          width: 10,
                        ),
                        Text(
                          "Get The App",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    ),
                  ),
                  // popupmenu item 2
                  PopupMenuItem(
                    value: 2,
                    // row has two child icon and text
                    child: Row(
                      children: const [
                        Icon(Icons.chrome_reader_mode),
                        SizedBox(
                          // sized box with width 10
                          width: 10,
                        ),
                        Text(
                          "About",
                          style: TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 18),
                        )
                      ],
                    ),
                  ),
                ],
                offset: const Offset(0, 100),
                color: Colors.orangeAccent.shade200,
                elevation: 2,
              ),
            ]),
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(height: 10),
              Image.asset(
                'images/125.png',
              ),
              const SizedBox(height: 15),
              const Divider(color: Colors.black),
              Container(
                  margin: const EdgeInsets.all(10),
                  padding: const EdgeInsets.all(10),
                  width: double.infinity,
                  color: Colors.blueGrey,
                  child: const Center(
                    child: Text('This is a text widget',
                        style: TextStyle(color: Colors.white)),
                  )),
              ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: isSwitch
                          ? Colors.orange.shade500
                          : Colors.greenAccent.shade400),
                  onPressed: () {
                    debugPrint('Elevated button');
                  },
                  child: const Text('Elevated Button',
                      style: TextStyle(color: Colors.white))),
              OutlinedButton(
                  onPressed: () {
                    debugPrint('Outlined button');
                  },
                  child: const Text('Outlined Button')),
              TextButton(
                  onPressed: () {
                    debugPrint('Text button');
                  },
                  child: const Text('Text Button')),
              GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    debugPrint('Gesture Detector');
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Icon(Icons.local_fire_department, color: Colors.blue),
                      Text('Row Widget'),
                      Icon(Icons.local_fire_department, color: Colors.blue),
                    ],
                  )),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Switch(
                    value: isSwitch,
                    onChanged: (bool newBool) {
                      setState(() {
                        isSwitch = newBool;
                      });
                    },
                  ),
                  Checkbox(
                      value: isCheckbox,
                      onChanged: (bool? newBool) {
                        setState(() {
                          isCheckbox = newBool;
                        });
                      }),
                ],
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Image.network(
                  'https://www.google.com/images/branding/googlelogo/2x/googlelogo_color_272x92dp.png',
                  width: double.infinity,
                ),
              ),
            ],
          ),
        ));
  }
}
