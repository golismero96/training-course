// ignore_for_file: file_names

import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:chat_app/screens/ForgetPass.dart';
import 'package:flutter/material.dart';

class Setting extends StatelessWidget {
  const Setting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          Expanded(
              child: ListView(children: [
            Column(children: [
              Container(
                  margin: const EdgeInsets.only(top: 30, left: 25),
                  alignment: Alignment.centerLeft,
                  child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgetPass()));
                    },
                    child: const CategoryTitle(
                        'Forget Password ?', Colors.redAccent, 15),
                  )),
              Center(child: Switch(value: false, onChanged: (val) {})),
            ]),
          ])),
        ],
      )),
    );
  }
}
