// ignore_for_file: file_names

import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:chat_app/modules/MessageWidget.dart';
import 'package:chat_app/screens/MessagesPage.dart';
import 'package:flutter/material.dart';

import 'package:chat_app/modules/MyProvider.dart';
import 'package:provider/provider.dart';

class NewMessage extends StatelessWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: SafeArea(
        child: MyStatefulWidget(),
      ),
    );
  }
}

enum BestTutorSite { javatpoint, w3schools, tutorialandexample }

class MyStatefulWidget extends StatefulWidget {
  const MyStatefulWidget({Key? key}) : super(key: key);

  @override
  _MyStatefulWidgetState createState() => _MyStatefulWidgetState();
}

class _MyStatefulWidgetState extends State<MyStatefulWidget> {
  List<Map> availableHobbies = [
    {"username": "Selma", "name": "Selma", "isChecked": false},
    {"username": "Emeline", "name": "Emeline", "isChecked": false},
    {"username": "Sonia", "name": "Sonia", "isChecked": false},
    {"username": "Jean", "name": "Jean", "isChecked": false},
    {"username": "Jack", "name": "Jack", "isChecked": false},
    {"username": "Sharma", "name": "Sharma", "isChecked": false},
    {"username": "Pahlavi", "name": "Pahlavi", "isChecked": false},
    {"username": "Arman", "name": "Arman", "isChecked": false},
    {"username": "Roy", "name": "Roy", "isChecked": false},
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const MessagesPage()));
                        },
                        child: Icon(Icons.arrow_back,
                            color: context.watch<MyProvider>().theme ==
                                    Themdata.dark
                                ? Colors.white
                                : Colors.black,
                            size: 30)),
                    const SizedBox(
                      width: 16,
                    ),
                    CategoryTitle(
                        'New message',
                        context.watch<MyProvider>().theme == Themdata.dark
                            ? Colors.white
                            : Colors.black,
                        22)
                  ],
                ),
                InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const MessagesPage()));
                    },
                    child: const CategoryTitle('Chat', Colors.lightBlue, 20)),
              ],
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: CategoryTitle(
                'To',
                context.watch<MyProvider>().theme == Themdata.dark
                    ? Colors.white
                    : Colors.grey.shade800,
                20),
          ),
          SizedBox(
            height: 55,
            width: double.infinity,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10),
              child: TextField(
                decoration: InputDecoration(
                  filled: false,
                  border: OutlineInputBorder(
                      borderSide: BorderSide.none,
                      borderRadius: BorderRadius.circular(12),
                      gapPadding: 4),
                  labelStyle: const TextStyle(fontSize: 16),
                  labelText: 'Search',
                ),
              ),
            ),
          ),
          // ListTile(
          //   title: const Text('www.w3school.com'),
          //   leading: Radio(
          //     value: BestTutorSite.w3schools,
          //     groupValue: _site,
          //     onChanged: (BestTutorSite? value) {
          //       setState(() {
          //         _site = value!;
          //       });
          //     },
          //   ),
          // ),
          // ListTile(
          //   title: const Text('www.tutorialandexample.com'),
          //   leading: Radio(
          //     value: BestTutorSite.tutorialandexample,
          //     groupValue: _site,
          //     onChanged: (BestTutorSite? value) {
          //       setState(() {
          //         _site = value!;
          //       });
          //     },
          //   ),
          // ),
          Expanded(
              child: ListView(
            scrollDirection: Axis.vertical,
            children: [
              Padding(
                padding: const EdgeInsets.only(
                    top: 10, bottom: 5, left: 15, right: 15),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryTitle(
                        'Suggested',
                        context.watch<MyProvider>().theme == Themdata.dark
                            ? Colors.white
                            : Colors.black87,
                        16),
                  ],
                ),
              ),
              Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: availableHobbies.map((hobby) {
                    return CheckboxListTile(
                        checkboxShape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20)),
                        contentPadding: const EdgeInsets.only(right: 10),
                        value: hobby["isChecked"],
                        title: MessageWidget(
                            family: hobby["name"],
                            pic:
                                'avatars/150-${availableHobbies.indexOf(hobby)}.jpg',
                            callVideo: false,
                            username: hobby["username"] ?? ''),
                        onChanged: (newValue) {
                          setState(() {
                            hobby["isChecked"] = newValue;
                          });
                        });
                  }).toList()),
            ],
          ))
        ],
      ),
    );
  }
}
