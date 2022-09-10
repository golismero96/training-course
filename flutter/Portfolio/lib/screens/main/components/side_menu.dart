import 'package:Portfolio/constants.dart';
import 'package:Portfolio/screens/main/components/Coding.dart';
import 'package:Portfolio/screens/main/components/area_info_text.dart';
import 'package:Portfolio/screens/main/components/knowledges.dart';
import 'package:Portfolio/screens/main/components/my_info.dart';
import 'package:Portfolio/screens/main/components/skills.dart';
import 'package:flutter/material.dart';
import 'package:age_calculator/age_calculator.dart';
import 'package:flutter_svg/flutter_svg.dart';

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
                      const Knowledges(),
                      Divider(),
                      SizedBox(height: defaultPadding / 2),
                      TextButton(onPressed: () {},
                          child: FittedBox(
                            child: Row(
                              children: [
                                Text('Download CV',
                                  style: TextStyle(color: Theme.of(context).textTheme.bodyText1!.color)
                                ),
                                SizedBox(width: defaultPadding / 2),
                                SvgPicture.asset("assets/icons/download.svg")
                              ]
                            ),
                          )
                      ),
                      Container(
                        margin: EdgeInsets.only(top: defaultPadding),
                        color: Color(0XFF24242E),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            IconButton(onPressed: () {}, icon: SvgPicture.asset("assets/icons/linkedin.svg")),
                            IconButton(onPressed: () {}, icon: SvgPicture.asset("assets/icons/github.svg")),
                            IconButton(onPressed: () {}, icon: SvgPicture.asset("assets/icons/twitter.svg")),
                          ],
                        )
                      ),
                    ]
                  )
              ),
            )
          ],
        )
    );
  }
}
