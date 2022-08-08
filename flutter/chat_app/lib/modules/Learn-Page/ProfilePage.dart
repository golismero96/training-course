// ignore_for_file: file_names

import 'package:flutter/material.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int itemCount = 20;
  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        itemCount: itemCount,
        itemBuilder: (BuildContext context, int index) => ListTile(
            title: Text('Item ${(index + 1)}'),
            leading: const Icon(Icons.person),
            trailing: IconButton(
              icon: const Icon(Icons.delete),
              onPressed: () {
                setState(() {
                  itemCount--;
                });
              },
            ),
            onTap: () {
              debugPrint('Item ${(index + 1)} was tapped.');
            }));
  }
}
