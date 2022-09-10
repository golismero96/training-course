import 'package:Portfolio/constants.dart';
import 'package:Portfolio/screens/main/components/side_menu.dart';
import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({Key? key, required this.children}) : super(key: key);

  final List<Widget> children;

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
                crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                        flex:2,
                        child: SideMenu()
                    ),
                    SizedBox(width: defaultPadding / 2),
                    Expanded(
                        flex: 7,
                        child: SingleChildScrollView(
                          child: Column(
                            children: [
                              ...children,
                            ],
                          )
                        )
                    ),
                    SizedBox(width: defaultPadding / 2),
                  ],
                ),
            ),
          )
        )
    );
  }
}
