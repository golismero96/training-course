import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:flutter/material.dart';
import './HomePage.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: <Widget>[
            Container(
              height: MediaQuery.of(context).size.height * 0.4,
              decoration: const BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.deepOrangeAccent, Colors.orange],
                  end: Alignment.bottomCenter,
                  begin: Alignment.topCenter
                ),
                borderRadius: BorderRadius.only(bottomLeft: Radius.circular(100))
              ),
              child: Center(
                child: Image.asset('images/13.png')
              ),
            ),
            const SizedBox(height: 10,),
            Expanded(
                child:
                ListView(
                  children: [
                    _textInput(hint: 'Username', icon: Icons.supervised_user_circle, secure: false),
                    _textInput(hint: 'Password', icon: Icons.password, secure: true),
                    Container(
                        margin: const EdgeInsets.only(top: 10, right: 25),
                        alignment: Alignment.centerRight,
                        child: const CategoryTitle('Forget Password??', Colors.redAccent, 15)
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 40, left: 25, right: 25),
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
                      child: const CategoryTitle('Login', Colors.white, 22.5)
                    )
                  ]
                )
            )
          ],
        )
      ),
    );
  }
}

Widget _textInput({controller, hint, icon, secure}) {
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
