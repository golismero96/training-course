import 'package:Portfolio/constants.dart';
import 'package:Portfolio/components/animated_circular_progress_indicator.dart';
import 'package:Portfolio/screens/main/components/Coding.dart';
import 'package:Portfolio/screens/main/components/area_info_text.dart';
import 'package:Portfolio/screens/main/components/my_info.dart';
import 'package:Portfolio/screens/main/components/skills.dart';
import 'package:flutter/material.dart';
import 'package:age_calculator/age_calculator.dart';
import 'package:flutter_svg/svg.dart';

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
                      const Skills(),
                      const SizedBox(height: defaultPadding),
                      const Coding(),
                      Divider(),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: defaultPadding),
                        child: Text('Knowledge', style: Theme.of(context).textTheme.subtitle2),
                      ),
                      Row(
                        children: [
                          SvgPicture.asset("assets/icons/check.svg"),
                        ]
                      )
                    ]
                  )
              ),
            )
          ],
        )
    );
  }
}
