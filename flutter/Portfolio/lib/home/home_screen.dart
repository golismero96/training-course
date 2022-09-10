import 'package:Portfolio/constants.dart';
import 'package:Portfolio/home/home_banner.dart';
import 'package:flutter/material.dart';
import 'package:Portfolio/screens/main/main_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MainScreen(
      children: [
        HomeBanner(),
      ],
    );
  }
}
