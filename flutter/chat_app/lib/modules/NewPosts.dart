// ignore_for_file: file_names

import 'package:chat_app/modules/Post.dart';
import 'package:flutter/material.dart';

class NewPosts extends StatelessWidget {
  const NewPosts({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        Post(),
        Post(),
      ],
    );
  }
}
