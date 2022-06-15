import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:flutter/material.dart';

class ButtonWidget extends StatelessWidget {
  final String text;
  const ButtonWidget(this.text, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.only(left: 25, right: 25),
        width: double.infinity,
        height: 50,
        decoration: const BoxDecoration(
            borderRadius: BorderRadius.all(Radius.circular(100)),
            gradient: LinearGradient(
                colors: [Colors.deepOrangeAccent, Colors.orange],
                end: Alignment.centerLeft,
                begin: Alignment.centerRight
            )
        ),
        alignment: Alignment.center,
        child: CategoryTitle(
            text,
            Colors.white, 22.5)
    );
  }
}
