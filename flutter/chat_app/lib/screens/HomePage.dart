// ignore_for_file: file_names

import 'package:chat_app/modules/MyProvider.dart';
import 'package:chat_app/modules/UserWidget.dart';
import 'package:chat_app/screens/MessagesPage.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
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
                  // const SizedBox(height: 25),
                  // Padding(
                  //   padding: const EdgeInsets.symmetric(horizontal: 15),
                  //   child:
                  //     TextField(
                  //         decoration: InputDecoration(
                  //           border: OutlineInputBorder(
                  //             borderRadius: BorderRadius.circular(15.0),
                  //             gapPadding: 4
                  //           ),
                  //           fillColor: Colors.grey,
                  //           labelStyle: TextStyle(color: Colors.grey[500], fontSize: 20),
                  //           labelText: 'Search',
                  //           prefixIcon: const Icon(Icons.search_outlined, color: Colors.grey, size:28) == null ? null : Icon(Icons.search_outlined, color: Colors.grey, size:28)
                  //         ),
                  //       ),
                  // ),
                  const SizedBox(height: 10),
                  Expanded(
                      child: ListView(
                    scrollDirection: Axis.vertical,
                    children: [
                      Container(
                        height: 115,
                        child: ListView(
                          scrollDirection: Axis.horizontal,
                          children: [
                            for (var member = 0; member < 10; member++) ...[
                              UserWidget(
                                  'avatars/150-$member.jpg', members[member])
                            ]
                          ],
                        ),
                      ),
                    ],
                  ))
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
              icon: const Icon(Icons.phone_outlined, color: Colors.grey),
              activeIcon: Icon(Icons.phone,
                  color: context.watch<MyProvider>().theme == Themdata.light
                      ? Colors.black87
                      : Colors.white),
              label: 'Call'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.camera_alt_outlined, color: Colors.grey),
              activeIcon: Icon(Icons.camera_alt,
                  color: context.watch<MyProvider>().theme == Themdata.light
                      ? Colors.black87
                      : Colors.white),
              label: 'Camera'),
          BottomNavigationBarItem(
              icon: const Icon(Icons.settings_outlined, color: Colors.grey),
              activeIcon: Icon(Icons.settings,
                  color: context.watch<MyProvider>().theme == Themdata.light
                      ? Colors.black87
                      : Colors.white),
              label: 'Setting'),
        ]));
  }
}
