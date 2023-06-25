
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import '../Model/EventsModel.dart';
import '../Provider/EventsFutureProvider.dart';

Future<List<EventsModel>> serializerModel(responseData) async {
  List<EventsModel> models = [];

  for (var model in responseData['product']) {
    models.add(EventsModel(model['imgUrl']));
  }

  return models;
}

SendRequestEvents(BuildContext context) async {

  try {
    final response = await http.get(
        Uri.parse('${dotenv.env['BASEAPI']}/events/')
    );
    var responseData = json.decode(response.body);
    final eventsFetch = Provider.of<EventsFutureProvider>(
        context,
        listen: false
    );
    Future<List<EventsModel>> models = serializerModel(responseData);
    eventsFetch.EventsFetched(models);

  } catch (error) {
    // Handle the error here
    print('Error occurred during API request: $error');
    return []; // Or you can return a default value or handle it in a different way
  }

}
