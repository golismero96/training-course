
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import '../Model/SpecialOfferModel.dart';
import '../Model/VenturesModel.dart';
import '../Provider/SpecialOffersFutureProvider.dart';
import '../Provider/VenturesFutureProvider.dart';

Future<List<SpecialOfferModel>> serializerModel(responseData) async {
  List<SpecialOfferModel> models = [];
  for (var model in responseData['product']) {
    models.add(SpecialOfferModel(
        model['id'],
        utf8.decode(model['productName'].toString().codeUnits),
        model['price'],
        model['off_price'],
        model['off_precent'],
        model['imgUrl']));
  }
  return models;
}

SendRequestSpecialOffers(BuildContext context) async {

  try {
    final response = await http.get(
        Uri.parse('${dotenv.env['BASEAPI']}/specialOffer/')
    );
    var responseData = json.decode(response.body);
    final spacialOffersFetch = Provider.of<SpecialOffersFutureProvider>(
        context,
        listen: false
    );
    Future<List<SpecialOfferModel>> models = serializerModel(responseData);
    spacialOffersFetch.SpecialOffersFetched(models);

  } catch (error) {
    // Handle the error here
    print('Error occurred during API request: $error');
    return []; // Or you can return a default value or handle it in a different way
  }
}
