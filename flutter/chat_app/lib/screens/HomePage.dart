// ignore_for_file: file_names

import 'package:chat_app/modules/MessageWidget.dart';
import 'package:chat_app/modules/MyElements.dart';
import 'package:chat_app/modules/MyProvider.dart';
import 'package:chat_app/modules/UserWidget.dart';
import 'package:flutter/material.dart';
import '../modules/CategoryTitle.dart';
import '../modules/MessageWidget.dart';
import 'package:provider/provider.dart';
import 'dart:math' as math;


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>{
  @override
  Widget build(BuildContext context) {
    final members = ["Selma", "Emeline", "Sonia", "Jean", "Jack", "Rajesh", "Sharma", "Pahlavi", "Arman", "Roy"];
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: const EdgeInsets.symmetric(vertical: 15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const CategoryTitle('Instagram', Colors.black87, 26),
                          // MySwitch(),
                          const MyDropDownButton([
                            DropdownMenuItem(child: CategoryTitle('تهران', Colors.black87, 23), value: 1),
                            DropdownMenuItem(child: CategoryTitle('مشهد', Colors.black87, 23), value: 2),
                            DropdownMenuItem(child: CategoryTitle('اصفهان', Colors.black87, 23), value: 3),
                          ]),
                          Switch(
                            value: context.watch<MyProvider>().theme == Themdata.dark, 
                            onChanged: (val)=> {
                              context.read<MyProvider>().setTheme(val ? Themdata.dark : Themdata.light)
                            }, activeColor: Colors.orange[700], inactiveTrackColor: Colors.orange[300], inactiveThumbColor: Colors.orange[600],)
                          // Transform.rotate(
                          //   angle: 180 * math.pi / 100,
                          //   child:
                          //     Icon(Icons.send, color: Colors.grey.shade800, size: 30,),
                          // ),
                          // CategoryTitle(swt.value ? 'true' : 'false', Colors.black, 23)
                          // TextButton(
                          //     child: Icon(Icons.edit_outlined, color: Colors.green),
                          //     onPressed: (){}
                          // )
                        ],
                      ),
                ),
                const SizedBox(height: 25),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                    TextField(
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(15.0),
                            gapPadding: 4
                          ),
                          fillColor: Colors.grey,
                          labelStyle: TextStyle(color: Colors.grey[500], fontSize: 20),
                          labelText: 'Search',
                          prefixIcon: const Icon(Icons.search_outlined, color: Colors.grey, size:28) == null ? null : Icon(Icons.search_outlined, color: Colors.grey, size:28)
                        ),
                      ),
                ),
                const SizedBox(height: 25,),
                Expanded(
                  child:
                  ListView(
                  scrollDirection: Axis.vertical,
                  children: [
                    Container(
                      height: 115,
                      child:
                        ListView(
                            scrollDirection: Axis.horizontal,
                            children: [
                              for(var member=0; member < 10; member++) ...[
                                UserWidget('avatars/150-$member.jpg', members[member])
                              ]
                            ],
                        ),
                    ),
                    Container(
                      width: 100,
                      height: 0.5,
                      color: Colors.grey.shade200
                    ),
                    for(var member=0; member < 10; member++) ...[
                      MessageWidget(family: members[member], msg: 'Hello how are you? I am going to market. do you want burgers?', pic: 'avatars/150-$member.jpg', time: '2$member min', count: (math.pi * (member + 1)).round())
                    ]
                  ],
                )
              ),
            ],
          )
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        iconSize: 35,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined, color: Colors.grey), activeIcon: Icon(Icons.chat, color: context.watch<MyProvider>().theme == Themdata.light ? Colors.black87 : Colors.white), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.phone_outlined, color: Colors.grey), activeIcon: Icon(Icons.phone, color: context.watch<MyProvider>().theme == Themdata.light ? Colors.black87 : Colors.white), label: 'Call'),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt_outlined, color: Colors.grey), activeIcon: Icon(Icons.camera_alt, color: context.watch<MyProvider>().theme == Themdata.light ? Colors.black87 : Colors.white), label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined, color: Colors.grey), activeIcon: Icon(Icons.settings, color: context.watch<MyProvider>().theme == Themdata.light ? Colors.black87 : Colors.white), label: 'Setting'),
        ]
      )
    );
  }
}