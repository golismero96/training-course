import 'package:flutter/material.dart';

import 'main.dart';


class BottomNav extends StatefulWidget {
  const BottomNav({Key? key}) : super(key: key);

  @override
  State<BottomNav> createState() => _BottomNavState();
}

class _BottomNavState extends State<BottomNav> {
  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      elevation: 80,
      shape: const CircularNotchedRectangle(),
      notchMargin: 6,
      color: Colors.white,
      child: Container(
        height: 60,
        child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Container(
                width: MediaQuery.of(context).size.width / 2 - 20,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.home, size: 32, color: Colors.grey.shade700)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.person, size: 32, color: Colors.grey.shade700)),
                  ],
                )
              ),
              Container(
                width: MediaQuery.of(context).size.width / 2 - 20,
                height: 50,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: (){}, icon: Icon(Icons.search, size: 32, color: Colors.grey.shade700)),
                    IconButton(onPressed: (){}, icon: Icon(Icons.shopping_basket, size: 32, color: Colors.grey.shade700)),
                  ],
                ),
              )
            ],
        ),
      ),
    );
  }
}
