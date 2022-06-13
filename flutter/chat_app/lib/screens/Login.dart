import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:chat_app/modules/TextInput.dart';
import 'package:chat_app/widgets/ButtonWidget.dart';
import 'package:chat_app/widgets/HeaderContainer.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            const HeaderContainer(),
            const SizedBox(height: 10,),
            Expanded(
                child:
                ListView(
                  children: [
                    const TextInput('Username', Icons.supervised_user_circle, false),
                    const TextInput('Password', Icons.password, true),
                    Container(
                        margin: const EdgeInsets.only(top: 10, right: 25),
                        alignment: Alignment.centerRight,
                        child: const CategoryTitle('Forget Password ?', Colors.redAccent, 15)
                    ),
                    const SizedBox(height: 40),
                    const Center(
                      child: ButtonWidget()
                    )
                  ]
                )
            ),
            RichText(text: const TextSpan(
                children: [
                  TextSpan(
                      text: "Don't have an account? ",
                      style: TextStyle(color: Colors.black, fontSize: 16)
                  ),
                  TextSpan(
                      text: "Register",
                      style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 16)
                  ),
                ]
            )),
            const SizedBox(height: 20,)
          ],
        )
      ),
    );
  }
}

