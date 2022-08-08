// ignore_for_file: file_names

import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:chat_app/screens/ForgetPass.dart';
import 'package:chat_app/modules/TextInput.dart';
import 'package:chat_app/screens/HomePage.dart';
import 'package:chat_app/screens/Registry.dart';
import 'package:chat_app/widgets/ButtonWidget.dart';
import 'package:chat_app/widgets/HeaderContainer.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        children: [
          const HeaderContainer('13.png'),
          const SizedBox(
            height: 10,
          ),
          Expanded(
              child: ListView(children: [
            const TextInput('Username', Icons.supervised_user_circle, false),
            const TextInput('Password', Icons.password, true),
            Container(
                margin: const EdgeInsets.only(top: 10, right: 25),
                alignment: Alignment.centerRight,
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const ForgetPass()));
                    },
                    child: const CategoryTitle(
                        'Forget Password ?', Colors.redAccent, 15))),
            const SizedBox(height: 40),
            Center(
                child: InkWell(
                    onTap: () {
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => const HomePage()));
                    },
                    child: const ButtonWidget('SignIn')))
          ])),
          Center(
              child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const Registry()));
                  },
                  child: RichText(
                      text: const TextSpan(
                    children: [
                      TextSpan(
                          text: "Don't have an account? ",
                          style: TextStyle(color: Colors.black, fontSize: 16)),
                      TextSpan(
                          text: "Register",
                          style: TextStyle(
                              color: Colors.deepOrangeAccent, fontSize: 16)),
                    ],
                  )))),
          const SizedBox(
            height: 20,
          )
        ],
      )),
    );
  }
}
