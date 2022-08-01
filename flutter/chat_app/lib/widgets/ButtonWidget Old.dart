// ignore_for_file: file_names

import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:chat_app/modules/MyProvider.dart';
import 'package:chat_app/modules/User.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ButtonWidget extends StatelessWidget {
  const ButtonWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Map<String, String> data = {'username': '', 'password': ''};
    return MaterialButton(
      child: Container(
          width: double.infinity,
          height: 50,
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(100)),
              gradient: LinearGradient(
                  colors: [Colors.deepOrangeAccent, Colors.orange],
                  end: Alignment.centerLeft,
                  begin: Alignment.centerRight)),
          alignment: Alignment.center,
          child: const CategoryTitle('SignIn', Colors.white, 22.5)),
      onPressed: () async {
        try {
          // context.read<MyProvider>().setIsLoading(true);
          context.read<MyProvider>().setUser(await User.authenticate(
              '${data['username']}', '${data['password']}'));
        } finally {
          // context.read<MyProvider>().setIsLoading(false);
        }
      },
    );
  }
}
