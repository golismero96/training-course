import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

import 'package:provider/provider.dart';
import '../Provider/ThemeProvider.dart';

class ThemeSwitcher extends StatefulWidget {
  const ThemeSwitcher({super.key});

  @override
  State<ThemeSwitcher> createState() => _ThemeSwitcherState();
}

class _ThemeSwitcherState extends State<ThemeSwitcher> {
  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);
    var switchIcon = Icon(themeProvider.isDarkMode ? CupertinoIcons.moon_fill : CupertinoIcons.sun_max_fill);

    return IconButton(
        onPressed: () {
          themeProvider.toggleTheme();
        },
        icon: switchIcon,
    );
  }
}
