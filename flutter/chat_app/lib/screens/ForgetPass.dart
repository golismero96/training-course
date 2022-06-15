import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:chat_app/modules/TextInput.dart';
import 'package:chat_app/screens/Login.dart';
import 'package:chat_app/widgets/ButtonWidget.dart';
import 'package:chat_app/widgets/HeaderContainer.dart';
import 'package:flutter/material.dart';

class ForgetPass extends StatelessWidget {
  const ForgetPass({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
            children: <Widget>[
              const HeaderContainer('20.png'),
              const SizedBox(height: 15,),
              Expanded(
                  child:
                  ListView(
                      children: [
                        const TextInput('Email', Icons.email_outlined, false),
                        const SizedBox(height: 20,),
                        Column(
                           children: [
                              InkWell(
                                onTap: (){
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=> const Login()));
                                },
                                child: const ButtonWidget('Send')
                              ),
                           ]
                        ),
                      ]
                  )
              ),
              Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.push(
                            context,
                            MaterialPageRoute(builder: (context)=> const Login())
                        );
                      },
                      child:
                      RichText(
                          text: const TextSpan(
                            children: [
                              TextSpan(
                                  text: "Do you have an account? ",
                                  style: TextStyle(color: Colors.black, fontSize: 16)
                              ),
                              TextSpan(
                                  text: "Login",
                                  style: TextStyle(color: Colors.deepOrangeAccent, fontSize: 16)
                              ),
                            ],
                          )
                      )
                  )
              ),
              const SizedBox(height: 10,)
            ],
          )
      ),
    );
  }
}
