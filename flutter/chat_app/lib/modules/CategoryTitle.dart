import 'package:flutter/material.dart';


class CategoryTitle extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  const CategoryTitle(this.title, this.color, this.fontSize , {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Text(title, style: TextStyle(fontSize: fontSize, fontWeight: FontWeight.bold, color: color));
  }
}
