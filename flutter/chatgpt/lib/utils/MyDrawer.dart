import 'package:flutter/material.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: const <Widget>[
        DrawerHeader(
          decoration: BoxDecoration(
              image: DecorationImage(
            image: AssetImage('images/drawer.jpg'),
            fit: BoxFit.cover,
          )),
          child: Text(
            'Digikala',
            style: TextStyle(
              color: Colors.white,
              fontSize: 24,
            ),
          ),
        ),
        ListTile(leading: Icon(Icons.home), title: Text('Home')),
        ListTile(
          leading: Icon(Icons.message),
          title: Text('Messages'),
        ),
        ListTile(
          leading: Icon(Icons.account_circle),
          title: Text('Profile'),
        ),
        ListTile(
          leading: Icon(Icons.settings),
          title: Text('Settings'),
        ),
      ],
    );
  }
}
