// ignore_for_file: file_names

import 'package:flutter/material.dart';

class FooterContainer extends StatelessWidget {
  final String image;
  const FooterContainer(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        bottomNavigationBar: BottomNavigationBar(iconSize: 35, items: const [
      BottomNavigationBarItem(
          icon: Icon(Icons.chat_outlined, color: Colors.grey),
          activeIcon: Icon(Icons.chat_outlined, color: Colors.black87),
          label: 'Chat'),
      BottomNavigationBarItem(
          icon: Icon(Icons.phone_outlined, color: Colors.grey),
          activeIcon: Icon(Icons.phone_outlined, color: Colors.black87),
          label: 'Call'),
      BottomNavigationBarItem(
          icon: Icon(Icons.camera_alt_outlined, color: Colors.grey),
          activeIcon: Icon(Icons.camera_alt_outlined, color: Colors.black87),
          label: 'Camera'),
      BottomNavigationBarItem(
          icon: Icon(Icons.settings_outlined, color: Colors.grey),
          activeIcon: Icon(Icons.settings_outlined, color: Colors.black87),
          label: 'Setting'),
    ]));
  }
}
