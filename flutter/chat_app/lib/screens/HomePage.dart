
import 'dart:ffi';

import 'package:chat_app/modules/UserWidget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../modules/CategoryTitle.dart';
import '../modules/ImageColorCircleAvatar.dart';


class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final members = ["Selma", "Emeline", "Sonia", "Jean", "Jack", "Rajesh", "Sharma", "Pahlavi", "Arman", "Roy"];
    return Scaffold(
      body: SafeArea(
          child: Container(
              padding: EdgeInsets.all(15),
              margin: EdgeInsets.symmetric(vertical: 15),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: const [
                      CategoryTitle('Messages', Colors.black87, 26),
                      Icon(Icons.edit, color: Colors.green),
                      // TextButton(
                      //     child: Icon(Icons.edit_outlined, color: Colors.green),
                      //     onPressed: (){}
                      // )
                    ],
                  ),
                  TextField(

                  ),
                  const SizedBox(height: 25,),
                  const CategoryTitle('Activities', Colors.black, 20),
                  const SizedBox(height: 25,),
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
                  const SizedBox(height: 25,),
                  const CategoryTitle('Messages', Colors.black, 20),
                  const SizedBox(height: 20),
                  Container(
                    child: Row(
                      children: [
                        UserWidget('avatars/150-1.jpg', members[1], hAvatarBox: 60, wAvatarBox: 60, showFamily: false),
                        const SizedBox(width: 10,),
                        Expanded(child:
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              CategoryTitle(members[1], Colors.black87, 18),
                              const SizedBox(height: 10,),
                              const CategoryTitle('Hello how are you? I am going to market. do you want burgers?', Colors.black54, 15),
                            ],
                          )
                        ),
                        Column(
                          children: [
                            const CategoryTitle('23min', Colors.greenAccent, 15),
                            const SizedBox(height: 10,),
                            CircleAvatar(
                              backgroundColor: Colors.green.shade400,
                              radius: 15,
                              child: CategoryTitle('1', Colors.white, 12)
                            )
                          ],
                        )
                      ],
                    )
                  )
                ],
              )
          ),
      )
    );
  }
}
