// ignore_for_file: file_names

import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:chat_app/modules/MessageWidget.dart';
import 'package:chat_app/modules/MyElements.dart';
import 'package:chat_app/modules/NewMessage.dart';
import 'package:chat_app/screens/HomePage.dart';
import 'package:flutter/material.dart';
import 'dart:math' as math;

import 'package:chat_app/modules/MyProvider.dart';
import 'package:provider/provider.dart';

class MessagesPage extends StatelessWidget {
  const MessagesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
    return Scaffold(
      body: SafeArea(
          child: Container(
        margin: const EdgeInsets.only(top: 10),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Icon(Icons.arrow_back,
                              color: context.watch<MyProvider>().theme ==
                                      Themdata.dark
                                  ? Colors.white
                                  : Colors.black,
                              size: 30)),
                      const SizedBox(
                        width: 30,
                      ),
                      const MyDropDownButton([
                        DropdownMenuItem(
                            child: CategoryTitle('Tehran', Colors.black87, 20),
                            value: 1),
                        DropdownMenuItem(
                            child: CategoryTitle('Mashad', Colors.black87, 20),
                            value: 2),
                        DropdownMenuItem(
                            child: CategoryTitle('Isfehan', Colors.black87, 20),
                            value: 3),
                      ]),
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.add_a_photo_outlined,
                          color:
                              context.watch<MyProvider>().theme == Themdata.dark
                                  ? Colors.white
                                  : Colors.black,
                          size: 30),
                      const SizedBox(
                        width: 20,
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const NewMessage()));
                          },
                          child: Icon(Icons.add,
                              color: context.watch<MyProvider>().theme ==
                                      Themdata.dark
                                  ? Colors.white
                                  : Colors.black,
                              size: 30)),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            Expanded(
                child: ListView(
              scrollDirection: Axis.vertical,
              children: [
                SizedBox(
                  height: 55,
                  width: double.infinity,
                  child: Padding(
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
                    child: TextField(
                      decoration: InputDecoration(
                          filled: true,
                          fillColor: Colors.blueGrey[50],
                          border: OutlineInputBorder(
                              borderSide: BorderSide.none,
                              borderRadius: BorderRadius.circular(12),
                              gapPadding: 4),
                          labelStyle:
                              TextStyle(color: Colors.grey[500], fontSize: 17),
                          labelText: 'Search',
                          prefixIcon: const Icon(Icons.search_outlined,
                              color: Colors.grey, size: 24)),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(
                      top: 10, bottom: 5, left: 15, right: 15),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      CategoryTitle(
                          'Messages',
                          context.watch<MyProvider>().theme == Themdata.dark
                              ? Colors.white
                              : Colors.black,
                          16),
                      const CategoryTitle('Requests', Colors.blue, 16),
                    ],
                  ),
                ),
                for (var member = 0; member < 10; member++) ...[
                  MessageWidget(
                    family: members[member],
                    msg:
                        'Hello how are you? I am going to market. do you want burgers?',
                    pic: 'avatars/150-$member.jpg',
                    time: '2$member min',
                    count: (math.pi * (member + 1)).round(),
                  )
                ]
              ],
            ))
          ],
        ),
      )),
    );
  }
}
