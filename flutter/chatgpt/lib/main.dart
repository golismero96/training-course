
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'HomePage.dart';
import 'Provider/ChangeNotifier.dart';
import 'Provider/PageViewFutureState.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  runApp(MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => PageViewFutureState()),
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