
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import '../Model/VenturesModel.dart';
import '../Provider/VenturesFutureProvider.dart';

Future<List<VenturesModel>> serializerModel(responseData) async {
  List<VenturesModel> models = [];
  for (var model in responseData['ventures']) {
    models.add(VenturesModel(model['text'], model['imgurl']));
  }
  return models;
}

SendRequestVentures(BuildContext context) async {

  try {
    final response = await http.get(
        Uri.parse('${dotenv.env['BASEAPI']}/events/venturesRender/')
    );
    var responseData = json.decode(response.body);
    final venturesFetch = Provider.of<VenturesFutureProvider>(
        context,
        listen: false
    );
    Future<List<VenturesModel>> models = serializerModel(responseData);
    venturesFetch.VenturesFetched(models);

  } catch (error) {
    // Handle the error here
    print('Error occurred during API request: $error');
    return []; // Or you can return a default value or handle it in a different way
  }
}
