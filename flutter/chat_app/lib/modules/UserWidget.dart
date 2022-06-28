import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/modules/MyProvider.dart';

class UserWidget extends StatelessWidget {
  final String image;
  final String family;
  final bool? showFamily;
  final double? hAvatarBox;
  final double? wAvatarBox;
  const UserWidget(this.image, this.family,
      {Key? key,
      this.showFamily = true,
      this.hAvatarBox = 55,
      this.wAvatarBox = 55})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final border_mode = context.watch<MyProvider>().theme == Themdata.dark
        ? Colors.black54
        : Colors.white;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          margin: const EdgeInsets.symmetric(horizontal: 10),
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [
              Colors.purpleAccent,
              Colors.deepOrange,
              Colors.yellow,
            ], begin: Alignment.topRight, end: Alignment.bottomLeft),
            // color: Colors.deepOrange,
            borderRadius: BorderRadius.circular(45),
          ),
          child: Container(
            height: hAvatarBox ?? 55,
            width: wAvatarBox ?? 55,
            padding: const EdgeInsets.all(2),
            decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(45),
                border: Border.all(color: border_mode, width: 3),
                image: DecorationImage(image: AssetImage('images/$image'))),
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        if (showFamily ?? true)
          CategoryTitle(family, Colors.black54, 16, fontWeight: FontWeight.bold)
      ],
    );
  }
}