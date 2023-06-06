
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'HomePage.dart';
import 'Provider/ChangeNotifier.dart';

void main() {
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => CounterModel()),
      ],
      child:MaterialApp(
    debugShowCheckedModeBanner: false,
    theme: ThemeData(
      colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
      tabBarTheme: const TabBarTheme(
        labelColor: Colors.red,
        unselectedLabelColor: Colors.grey,
      ),
      textTheme: const TextTheme(bodyMedium: TextStyle(fontFamily: 'Vazir')),
    ),
    home: const HomePage(),
  )));
}