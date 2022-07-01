// ignore_for_file: file_names

import 'package:chat_app/modules/NewPosts.dart';
import 'package:chat_app/modules/SidebarStory.dart';
import 'package:flutter/material.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: ListView(
      scrollDirection: Axis.vertical,
      children: const [SidebarStory(), NewPosts()],
    ));
  }
}
