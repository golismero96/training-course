
import 'package:chat_app/modules/MessageWidget.dart';
import 'package:chat_app/modules/MyProvider.dart';
import 'package:chat_app/modules/UserWidget.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../modules/CategoryTitle.dart';
import '../modules/MessageWidget.dart';
import 'dart:math' as math;


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final members = ["Selma", "Emeline", "Sonia", "Jean", "Jack", "Rajesh", "Sharma", "Pahlavi", "Arman", "Roy"];
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.symmetric(vertical: 15),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 15),
                  child:
                    Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          CategoryTitle('Instagram', Colors.black87, 26),
                          Transform.rotate(
                            angle: 180 * math.pi / 100,
                            child:
                              const Icon(Icons.send_sharp, color: Colors.green),
                          )
                          // TextButton(
                          //     child: Icon(Icons.edit_outlined, color: Colors.green),
                          //     onPressed: (){}
                          // )
                        ],
                      ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    CategoryTitle(context.read<MyProvider>().toString(), Colors.black87, 26),
                    Transform.rotate(
                      angle: 180 * math.pi / 100,
                      child:
                      const Icon(Icons.send_sharp, color: Colors.green),
                    )
                    // TextButton(
                    //     child: Icon(Icons.edit_outlined, color: Colors.green),
                    //     onPressed: (){}
                    // )
                  ],
                ),
                const SizedBox(height: 25,),
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
                          prefixIcon: Icon(Icons.search_outlined, color: Colors.grey, size:28)==null ? null : Icon(Icons.search_outlined, color: Colors.grey, size:28)
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
        items: const [
          BottomNavigationBarItem(icon: Icon(Icons.chat_outlined, color: Colors.grey), activeIcon: Icon(Icons.chat_outlined, color: Colors.black87), label: 'Chat'),
          BottomNavigationBarItem(icon: Icon(Icons.phone_outlined, color: Colors.grey), activeIcon: Icon(Icons.phone_outlined, color: Colors.black87), label: 'Call'),
          BottomNavigationBarItem(icon: Icon(Icons.camera_alt_outlined, color: Colors.grey), activeIcon: Icon(Icons.camera_alt_outlined, color: Colors.black87), label: 'Camera'),
          BottomNavigationBarItem(icon: Icon(Icons.settings_outlined, color: Colors.grey), activeIcon: Icon(Icons.settings_outlined, color: Colors.black87), label: 'Setting'),
        ]
      )
    );
  }
}