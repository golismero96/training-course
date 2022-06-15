import 'package:flutter/material.dart';

class WelcomPage extends StatelessWidget {
  const WelcomPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: new Stack(
          children: <Widget>[
            new Container(
              decoration: new BoxDecoration(
                image: new DecorationImage(image: new AssetImage("images/sigma/14.png"), fit: BoxFit.cover,),
              ),
            ),
            new Center(
              child: new Text("Hello background"),
            )
          ],
        )
    );
  }
}
