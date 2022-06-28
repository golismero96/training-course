// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ImageColorCircleAvatar extends StatelessWidget {
  final Color color;
  final String image;
  final double borderRaduis;
  const ImageColorCircleAvatar(this.image, this.color, this.borderRaduis, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: color,
      backgroundImage: AssetImage('images/$image'),
      radius: borderRaduis,
    );
  }
}
