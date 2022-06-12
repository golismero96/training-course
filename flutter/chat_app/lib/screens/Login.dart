import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:chat_app/modules/TextInput.dart';
import 'package:chat_app/widgets/HeaderContainer.dart';
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
                        child: const CategoryTitle('Forget Password??', Colors.redAccent, 15)
                    ),
                    Center(
                      child: InkWell(
                        onTap: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context)=> const RegPage()));
                        },
                        child:
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
                          ),
                      )
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
            const SizedBox(height: 10,)
          ],
        )
      ),
    );
  }
}
class RegPage extends StatelessWidget {
  const RegPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.only(top: 40, left: 10),
        width: double.infinity,
        height: 50,
        color: Colors.deepOrange,
        child: const Text('Logined', style: TextStyle(color: Colors.white),)
    );
  }
}
