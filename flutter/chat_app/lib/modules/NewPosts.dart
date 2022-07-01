// ignore_for_file: file_names

import 'package:chat_app/modules/Post.dart';
import 'package:chat_app/modules/UserWidget.dart';
import 'package:flutter/material.dart';

class NewPosts extends StatelessWidget {
  const NewPosts({Key? key}) : super(key: key);

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
    return Container(
      child: Column(
        children: const [
          Post(),
          Post(),
        ],
      ),
    );
  }
}
