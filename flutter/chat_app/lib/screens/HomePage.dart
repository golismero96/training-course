// ignore_for_file: file_names

import 'package:chat_app/modules/MainPage.dart';
import 'package:chat_app/screens/MessagesPage.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:chat_app/modules/MyProvider.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final members = [
    "Selma",
    "Emeline",
    "Sonia",
    "Jean",
    "Jack",
    "Rajesh",
    "Sharma",
    "Pahlavi",
    "Arman",
    "Roy"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Container(
              margin: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          'Instagram',
                          style: GoogleFonts.lobster(
                            textStyle:
                                Theme.of(context).textTheme.displayMedium,
                            fontSize: 30,
                            color: context.watch<MyProvider>().theme ==
                                    Themdata.dark
                                ? Colors.white
                                : Colors.black,
                          ),
                        ),

                        Switch(
                          value: context.watch<MyProvider>().theme ==
                              Themdata.dark,
                          onChanged: (val) => {
                            context
                                .read<MyProvider>()
                                .setTheme(val ? Themdata.dark : Themdata.light)
                          },
                          activeColor: Colors.orange[700],
                          inactiveTrackColor: Colors.orange[300],
                          inactiveThumbColor: Colors.orange[600],
                        ),

                        InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const MessagesPage()));
                          },
                          child: Transform.rotate(
                            angle: 180 * math.pi / 100,
                            child: Icon(
                              Icons.send_outlined,
                              color: context.watch<MyProvider>().theme ==
                                      Themdata.dark
                                  ? Colors.white
                                  : Colors.grey.shade900,
                              size: 30,
                            ),
                          ),
                        )
                        // CategoryTitle(swt.value ? 'true' : 'false', Colors.black, 23),
                        // TextButton(
                        //     child: Icon(Icons.edit_outlined, color: Colors.green),
                        //     onPressed: (){}
                        // )
                      ],
                    ),
                  ),
                  const SizedBox(height: 10),
                  const MainPage(),
                ],
              )),
        ),
        bottomNavigationBar: BottomNavigationBar(iconSize: 35, items: [
          BottomNavigationBarItem(
              icon: const Icon(Icons.home, color: Colors.grey),
              activeIcon: Icon(Icons.home_filled,
                  color: context.watch<MyProvider>().theme == Themdata.light
                      ? Colors.black87
                      : Colors.white),
              label: 'Chat'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.search_outlined, color: Colors.grey),
              activeIcon: Icon(Icons.search,
                  color: context.watch<MyProvider>().theme == Themdata.light
                      ? Colors.black87
                      : Colors.white),
              label: 'Search'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.add_box_outlined, color: Colors.grey),
              activeIcon: Icon(Icons.add_box_rounded,
                  color: context.watch<MyProvider>().theme == Themdata.light
                      ? Colors.black87
                      : Colors.white),
              label: 'New'),
          BottomNavigationBarItem(
              icon: const Icon(CupertinoIcons.heart, color: Colors.grey),
              activeIcon: Icon(CupertinoIcons.heart_fill,
                  color: context.watch<MyProvider>().theme == Themdata.light
                      ? Colors.black87
                      : Colors.white),
              label: 'Like'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.person_outline, color: Colors.grey),
              activeIcon: Icon(Icons.person,
                  color: context.watch<MyProvider>().theme == Themdata.light
                      ? Colors.black87
                      : Colors.white),
              label: 'Profile'),
        ]));
  }
}
