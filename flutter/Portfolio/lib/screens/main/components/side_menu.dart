import 'package:Portfolio/constants.dart';
import 'package:Portfolio/components/animated_circular_progress_indicator.dart';
import 'package:Portfolio/screens/main/components/area_info_text.dart';
import 'package:Portfolio/screens/main/components/my_info.dart';
import 'package:Portfolio/screens/main/components/skills.dart';
import 'package:flutter/material.dart';
import 'package:age_calculator/age_calculator.dart';

class SideMenu extends StatelessWidget {
  const SideMenu({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    DateTime birthday = DateTime(1996, 4, 27);

    return Drawer(
        child: Column(
      children: [
        const MyInfo(),
        Expanded(
          child: SingleChildScrollView(
              padding: EdgeInsets.all(defaultPadding),
              child: Column(
                children: [
                  const AreaInfoText(title: "Residence", text: "Iran"),
                  const AreaInfoText(title: "City", text: "Mashhad"),
                  AreaInfoText(title: "Age", text: AgeCalculator.age(birthday).years.toString()),
                  Skills(),
                ]
              )
          ),
        )
      ],
    ));
  }
}
