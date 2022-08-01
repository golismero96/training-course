// ignore_for_file: file_names

import 'package:flutter/material.dart';

class HeaderContainer extends StatelessWidget {
  final String image;
  const HeaderContainer(this.image, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: MediaQuery.of(context).size.height * 0.4,
      decoration: const BoxDecoration(
          gradient: LinearGradient(
              colors: [Colors.deepOrangeAccent, Colors.orange],
              end: Alignment.bottomCenter,
              begin: Alignment.topCenter),
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))),
      child: Center(child: Image.asset('images/$image')),
    );
  }
}
