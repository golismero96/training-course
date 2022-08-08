// ignore_for_file: file_names

import 'package:chat_app/modules/Learn-Page/HomePage.dart';
import 'package:chat_app/modules/Learn-Page/ProfilePage.dart';
import 'package:flutter/material.dart';

class LearnPage extends StatelessWidget {
  const LearnPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(primarySwatch: Colors.orange),
        home: const RootPage());
  }
}

class RootPage extends StatefulWidget {
  const RootPage({Key? key}) : super(key: key);

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  int currentPage = 0;
  List<Widget> pages = const [
    HomePage(),
    ProfilePage(),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            title: const Text('Flutter', style: TextStyle(color: Colors.white)),
            backgroundColor: Colors.orange.shade500),
        floatingActionButton: FloatingActionButton(
            child: const Icon(Icons.add, color: Colors.white),
            onPressed: () {
              debugPrint('Floating Action Button Pressed');
            }
            // onPressed: () {
            //   Navigator.push(context,
            //       MaterialPageRoute(builder: (context) => const Login()));
            // }
            ),
        bottomNavigationBar: NavigationBar(
          destinations: const [
            NavigationDestination(
                icon: Icon(Icons.home, color: Colors.white), label: 'Home'),
            // NavigationDestination(icon: Icon(Icons.search), label: 'Explore'),
            // NavigationDestination(
            //     icon: Icon(Icons.favorite_outline), label: 'Favorite'),
            NavigationDestination(
                icon: Icon(Icons.person, color: Colors.white),
                label: 'Profile'),
          ],
          onDestinationSelected: (int index) {
            setState(() {
              currentPage = index;
            });
          },
          selectedIndex: currentPage,
        ),
        body: pages[currentPage]);
  }
}
