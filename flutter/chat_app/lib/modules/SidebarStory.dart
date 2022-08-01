// ignore_for_file: file_names

import 'package:chat_app/modules/UserWidget.dart';
import 'package:flutter/material.dart';

class SidebarStory extends StatelessWidget {
  const SidebarStory({Key? key}) : super(key: key);

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
    return SizedBox(
      height: 115,
      child: ListView(
        scrollDirection: Axis.horizontal,
        children: [
          for (var member = 0; member < 10; member++) ...[
            UserWidget('avatars/150-$member.jpg', members[member])
          ]
        ],
      ),
    );
  }
}
