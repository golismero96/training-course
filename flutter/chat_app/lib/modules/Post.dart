// ignore_for_file: file_names

import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:chat_app/modules/UserWidget.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/modules/MyProvider.dart';
import 'package:provider/provider.dart';

class Post extends StatelessWidget {
  const Post({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        const UserWidget('avatars/150-1.jpg', 'Selma',
                            hAvatarBox: 40, wAvatarBox: 40, showFamily: false),
                        const SizedBox(
                          width: 10,
                        ),
                        Row(
                          children: const [
                            CategoryTitle('Selma', Colors.black87, 18),
                            SizedBox(
                              width: 10,
                            ),
                            Icon(Icons.verified, color: Colors.blue, size: 18)
                          ],
                        ),
                      ],
                    ),
                    Icon(Icons.more_horiz,
                        size: 28,
                        color:
                            context.watch<MyProvider>().theme == Themdata.dark
                                ? Colors.white
                                : Colors.grey[700])
                  ],
                ),
              ),
              Container(
                height: 300,
                padding: const EdgeInsets.all(2),
                decoration: BoxDecoration(
                    color: Colors.blueGrey[50],
                    image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('images/125.png'))),
              )
            ],
          ),
        ),
      ],
    );
  }
}
