// ignore_for_file: file_names

import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:chat_app/modules/MyElements.dart';
import 'package:chat_app/modules/TextInput.dart';
import 'package:chat_app/screens/Login.dart';
import 'package:chat_app/widgets/HeaderContainer.dart';
import 'package:flutter/material.dart';

class Registry extends StatelessWidget {
  const Registry({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: <Widget>[
          const HeaderContainer('10.png'),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView(children: [
            const TextInput('Name', Icons.account_box, false),
            const TextInput('Family', Icons.family_restroom, false),
            const TextInput('Username', Icons.supervised_user_circle, false),
            const TextInput('Password', Icons.password, true),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: const [
                CategoryTitle(
                    'I agree with the rules of the site', Colors.black87, 15),
                MyCheckbox(),
              ],
            ),
            Center(
                child: InkWell(
              onTap: () {
                Navigator.push(context,
                    MaterialPageRoute(builder: (context) => const Login()));
              },
              child: Container(
                  margin: const EdgeInsets.only(top: 10, left: 25, right: 25),
                  width: double.infinity,
                  height: 50,
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(100)),
                      gradient: LinearGradient(
                          colors: [Colors.deepOrangeAccent, Colors.orange],
                          end: Alignment.centerLeft,
                          begin: Alignment.centerRight)),
                  alignment: Alignment.center,
                  child: const CategoryTitle('SignUp', Colors.white, 22.5)),
            ))
          ])),
          Center(
              child: InkWell(
                  onTap: () {
                    Navigator.push(context,
                        MaterialPageRoute(builder: (context) => const Login()));
                  },
                  child: RichText(
                      text: const TextSpan(
                    children: [
                      TextSpan(
                          text: "Do you have an account? ",
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      TextSpan(
                          text: "Login",
                          style: TextStyle(
                              color: Colors.deepOrangeAccent, fontSize: 16)),
                    ],
                  )))),
          const SizedBox(
            height: 10,
          )
        ],
      )),
    );
  }
}
