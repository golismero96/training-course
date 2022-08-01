// ignore_for_file: file_names

import 'package:flutter/material.dart';

class BankPage extends StatelessWidget {
  const BankPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: const Color.fromARGB(255, 27, 32, 39),
        height: double.infinity,
        width: double.infinity,
        child: SafeArea(
          child: Container(
              padding: const EdgeInsets.all(12),
              child: Column(
                children: [
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 24),
                      child: Row(
                        children: const [
                          Icon(Icons.menu, color: Colors.white),
                          SizedBox(
                            width: 20,
                          ),
                          Text(
                            'My Bank',
                            style: TextStyle(color: Colors.white, fontSize: 20),
                          ),
                        ],
                      )),
                  const SizedBox(height: 25),
                  Stack(children: [
                    Transform(
                      alignment: FractionalOffset.center,
                      transform: Matrix4.identity()
                        ..rotateZ(-12 * 3.1415927 / 180),
                      child: Container(
                          height: 210,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(38),
                              gradient: LinearGradient(
                                  colors: [
                                    const Color.fromARGB(255, 69, 74, 88)
                                        .withOpacity(0.15),
                                    const Color.fromARGB(255, 96, 113, 134)
                                        .withOpacity(0.45)
                                  ],
                                  begin: Alignment.centerRight,
                                  end: Alignment.centerLeft))),
                    ),
                    Container(
                        height: 210,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(38),
                            gradient: LinearGradient(
                                colors: [
                                  const Color.fromARGB(255, 69, 74, 88)
                                      .withOpacity(0.15),
                                  const Color.fromARGB(255, 96, 113, 134)
                                      .withOpacity(0.45)
                                ],
                                begin: Alignment.centerRight,
                                end: Alignment.centerLeft))),
                    Container(
                      padding: const EdgeInsets.all(32.0),
                      child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            SizedBox(
                              width: 100,
                              height: 25,
                              child: Stack(
                                children: [
                                  Positioned(
                                      left: 0,
                                      child: CircleAvatar(
                                        backgroundColor:
                                            Colors.deepOrange.withOpacity(0.75),
                                        radius: 8,
                                      )),
                                  Positioned(
                                      left: 9,
                                      child: CircleAvatar(
                                        backgroundColor: const Color.fromARGB(
                                                255, 255, 240, 34)
                                            .withOpacity(0.75),
                                        radius: 8,
                                      ))
                                ],
                              ),
                            ),
                            const SizedBox(height: 8),
                            const Text('Card Name',
                                style: TextStyle(
                                    color: Colors.grey, fontSize: 12)),
                            const Text('Master Card',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 14)),
                            const SizedBox(height: 20),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text('**** **** **** 5689',
                                    style: TextStyle(
                                        color: Colors.white,
                                        fontSize: 28,
                                        fontWeight: FontWeight.bold)),
                              ],
                            ),
                            const SizedBox(height: 12),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  children: const [
                                    Text('Expires',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12)),
                                    SizedBox(width: 5),
                                    Text('12/20',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12)),
                                  ],
                                ),
                                Column(
                                  children: const [
                                    Text('CVV2',
                                        style: TextStyle(
                                            color: Colors.grey, fontSize: 12)),
                                    SizedBox(width: 5),
                                    Text('0933',
                                        style: TextStyle(
                                            color: Colors.white, fontSize: 12)),
                                  ],
                                ),
                              ],
                            ),
                          ]),
                    )
                  ]),
                  const SizedBox(height: 35),
                  const Text('Send money',
                      style: TextStyle(color: Colors.white, fontSize: 16)),
                  const SizedBox(height: 15),
                  Row(
                    children: [
                      Column(
                        children: [
                          Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Colors.transparent,
                                  border: Border.all(color: Colors.grey)),
                              padding: const EdgeInsets.all(8),
                              child: const Icon(Icons.add, color: Colors.grey)),
                          const SizedBox(height: 5),
                          const Text('Add',
                              style: TextStyle(color: Colors.white))
                        ],
                      ),
                      Container(
                        margin: const EdgeInsets.symmetric(horizontal: 8),
                        child: Column(
                          children: const [
                            CircleAvatar(
                              backgroundImage:
                                  AssetImage('images/avatars/150-1.jpg'),
                            ),
                            SizedBox(height: 5),
                            Text('Sara', style: TextStyle(color: Colors.white))
                          ],
                        ),
                      )
                    ],
                  )
                ],
              )),
        ),
      ),
    );
  }
}
