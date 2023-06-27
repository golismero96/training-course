import 'package:chatgpt/utils/MyDrawer.dart';
import 'package:chatgpt/utils/MyThemes.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:resize/resize.dart';

import 'HomePage.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

import 'Provider/EventsFutureProvider.dart';
import 'Provider/PageViewFutureProvider.dart';
import 'Provider/SpecialOffersFutureProvider.dart';
import 'Provider/ThemeProvider.dart';
import 'Provider/VenturesFutureProvider.dart';
import 'Widget/ThemeSwitcher.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(MultiProvider(
    providers: [
      ChangeNotifierProvider(create: (context) => PageViewFutureProvider()),
      ChangeNotifierProvider(create: (context) => VenturesFutureProvider()),
      ChangeNotifierProvider(
          create: (context) => SpecialOffersFutureProvider()),
      ChangeNotifierProvider(create: (context) => EventsFutureProvider()),
      ChangeNotifierProvider(create: (context) => ThemeProvider()),
    ],
    child: const MyMaterialApp(),
  ));
}

class MyMaterialApp extends StatefulWidget {
  const MyMaterialApp({super.key});

  @override
  State<MyMaterialApp> createState() => _MyMaterialAppState();
}

class _MyMaterialAppState extends State<MyMaterialApp> {
  @override
  Widget build(BuildContext context) {
    return Consumer<ThemeProvider>(builder: (context, themeProvider, child) {
      return MaterialApp(
          debugShowCheckedModeBanner: false,
          themeMode: themeProvider.themeMode,
          theme: MyThemes.darkTheme,
          darkTheme: MyThemes.darkTheme,
          home: Directionality(
              textDirection: TextDirection.rtl,
              child: Resize(builder: () {
                return Scaffold(
                    drawer: const Drawer(child: MyDrawer()),
                    appBar: AppBar(
                      title: const Text('DadfarJs'),
                      backgroundColor: Colors.red,
                      actions: const <Widget>[ThemeSwitcher()],
                    ),
                    body: const HomePage());
              })));
    });
  }
}
// ThemeData(
// colorScheme: ColorScheme.fromSeed(seedColor: Colors.red),
// tabBarTheme: const TabBarTheme(
// labelColor: Colors.red,
// unselectedLabelColor: Colors.grey,
// ),
// textTheme:
// const TextTheme(bodyMedium: TextStyle(fontFamily: 'Vazir')),
// ),
