// ignore_for_file: file_names

import 'package:chat_app/modules/MyProvider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:chat_app/modules/User.dart';

// class TextInput extends StatefulWidget {
//   final String hint;
//   final IconData icon;
//   final bool secure;
//   const TextInput(this.hint, this.icon, this.secure, {Key? key}) : super(key: key);
//
//   @override
//   _MyCustomFormState createState() => _MyCustomFormState();
// }
//
// class _MyCustomFormState extends State<TextInput> {
//
//   final myController = TextEditingController();
//
//   @override
//   void dispose() {
//     // Clean up the controller when the widget is disposed.
//     myController.dispose();
//     super.dispose();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       margin: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
//       decoration: const BoxDecoration(
//           borderRadius: BorderRadius.all(Radius.circular(20)),
//           color: Colors.white
//       ),
//       padding: const EdgeInsets.only(left: 10),
//       child: TextFormField(
//         obscureText: widget.secure,
//         controller: myController,
//         decoration: InputDecoration(
//             border: InputBorder.none,
//             hintText: widget.hint,
//             prefixIcon: Icon(widget.icon)
//         ),
//       ),
//     );
//   }
// }


class TextInput extends StatelessWidget {
  final String hint;
  final IconData icon;
  final bool secure;
  const TextInput(this.hint, this.icon, this.secure, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final myController = TextEditingController();
    return Container(
      margin: const EdgeInsets.only(top: 10, left: 15, right: 15, bottom: 10),
      decoration: const BoxDecoration(
          borderRadius: BorderRadius.all(Radius.circular(20)),
          color: Colors.white
      ),
      padding: const EdgeInsets.only(left: 10),
      child: Column(
        children: [
          TextFormField(
            obscureText: secure,
            controller: myController,
            decoration: InputDecoration(
                border: InputBorder.none,
                hintText: hint,
                prefixIcon: Icon(icon)
            ),
            onChanged: (String value) async {
              if (value != '13') {
                return;
              }
              if(hint == 'Username') {
                context.read<MyProvider>().setUser(await User.authenticate(value, ''));
              }
              else {
                context.read<MyProvider>().setUser(await User.authenticate('', value));
              }
            },
          ),
        ],
      )
    );
  }
}
