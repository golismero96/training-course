import 'package:flutter/material.dart';

import 'package:http/http.dart' as http;
import 'dart:convert';
import 'BottomNavigationBar.dart';
import 'Model/SpecialOfferModel.dart';

class AllProduct extends StatefulWidget {
  const AllProduct({Key? key}) : super(key: key);

  @override
  State<AllProduct> createState() => _AllProductState();
}

class _AllProductState extends State<AllProduct> {
  String baseAPI = 'http://151.80.86.139:8080';
  Future<List<SpecialOfferModel>>? specialofferFuture;


  @override
  void initState() {
    super.initState();
    setState(() {
      specialofferFuture = SendRequestSpecialOffer();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () {},
        backgroundColor: Colors.red,
        child: const Icon(Icons.add),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      bottomNavigationBar: BottomNav(),
      appBar: AppBar(
        centerTitle: true,
        title: const Text('فروشگاه', style: TextStyle(fontFamily: 'Vazir')),
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
        child: Container(

        ),
      ),
    );
  }

  Future<List<SpecialOfferModel>> SendRequestSpecialOffer() async {
    List<SpecialOfferModel> models = [];

    try {
      final response = await http.get(Uri.parse('${baseAPI}/specialOffer/'));
      var responseData = json.decode(response.body);

      for (var item in responseData['product']) {
        models.add(SpecialOfferModel(
            item['id'],
            utf8.decode(item['productName'].toString().codeUnits),
            item['price'],
            item['off_price'],
            item['off_precent'],
            item['imgUrl']));
      }

      return models;
    } catch (error) {
      // Handle the error here
      print('Error occurred during API request: $error');
      return []; // Or you can return a default value or handle it in a different way
    }
  }

}
