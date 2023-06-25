
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import '../Model/PageViewModel.dart';
import '../Provider/PageViewFutureProvider.dart';

Future<List<PageViewModel>> serializerModel(responseData) async {
  List<PageViewModel> model = [];
  for (var item in responseData['photos']) {
    model.add(PageViewModel(item['id'], item['imgurl']));
  }
  return model;
}

SendRequestPageView(BuildContext context) async {
  try {
    final response = await http.get(
        Uri.parse('${dotenv.env['BASEAPI']}/pageViewPics/')
    );
    var responseData = json.decode(response.body);
    final pageFetch = Provider.of<PageViewFutureProvider>(
        context,
        listen: false
    );
    Future<List<PageViewModel>> models = serializerModel(responseData);
    pageFetch.PageViewFetched(models);
  } catch (error) {
    // Handle the error here
    print('Error occurred during API request: $error');
  }
}
