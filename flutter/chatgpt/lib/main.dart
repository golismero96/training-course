
import 'package:chatgpt/utils/MyDrawer.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

import 'HomePage.dart';
import 'Provider/ChangeNotifier.dart';
import 'Provider/PageViewFutureProvider.dart';
import 'package:flutter_native_splash/flutter_native_splash.dart';

void main() async {
  await dotenv.load(fileName: ".env");
  WidgetsBinding widgetsBinding = WidgetsFlutterBinding.ensureInitialized();
  FlutterNativeSplash.preserve(widgetsBinding: widgetsBinding);
  runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (context) => PageViewFutureProvider()),
          ChangeNotifierProvider(create: (context) => CounterModel()),
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
        )
      )
  );
}