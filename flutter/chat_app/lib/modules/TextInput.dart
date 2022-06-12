import 'package:flutter/material.dart';

class TextInput extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool secure;
  const TextInput(this.hint, this.icon, this.secure, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white
      ),
      padding: const EdgeInsets.only(left: 10),
      child: TextFormField(
        obscureText: secure,
        decoration: InputDecoration(
            border: InputBorder.none,
            hintText: hint,
            prefixIcon: Icon(icon)
        ),
      ),
    );
  }
}
