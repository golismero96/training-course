// ignore_for_file: file_names

import 'package:chat_app/modules/MyProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CategoryTitle extends StatelessWidget {
  final String title;
  final Color color;
  final double fontSize;
  final FontWeight? fontWeight;
  final TextOverflow? overflow;
  const CategoryTitle(
    this.title,
    this.color,
    this.fontSize, {
    Key? key,
    this.fontWeight,
    this.overflow,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // ignore: unrelated_type_equality_checks
    return Text(title,
        style: TextStyle(
            overflow: overflow != null ? overflow : TextOverflow.visible,
            fontSize: fontSize,
            fontWeight:
                fontWeight == FontWeight.bold ? FontWeight.bold : fontWeight,
            color: context.watch<MyProvider>().theme == Themdata.light
                ? color
                : Colors.white));
  }
}
