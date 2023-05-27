import 'package:flutter/material.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({Key? key}) : super(key: key);

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text('فروشگاه'),
        backgroundColor: Colors.red,
        actions: [
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.map),
          ),
        ],
      ),
      body: Theme(
        data: ThemeData.from(
          colorScheme: ColorScheme.fromSwatch(primarySwatch: Colors.red),
        ),
        child: const Placeholder(

        ),
      ),
    );
  }
}
