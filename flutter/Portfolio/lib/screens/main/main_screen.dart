import 'package:Portfolio/constants.dart';
import 'package:Portfolio/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: Center(
            child: Container(
              constraints: BoxConstraints(
                maxHeight: maxWidth,
              ),
              child: Row(
                  children: [
                    Expanded(
                        flex:2,
                        child: SideMenu()
                    ),
                    Expanded(
                        flex: 7,
                        child: Container(
                            color: Colors.blue,
                            child: Center(
                                child: Text('Hello World', style: TextStyle(color: Colors.white, fontSize: 30))
                            )
                        )
                    ),
                  ],
                ),
            ),
          )
        )
    );
  }
}
