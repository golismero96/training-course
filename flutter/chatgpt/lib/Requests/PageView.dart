
import 'dart:convert';
import 'dart:js';

import 'package:flutter/src/widgets/framework.dart';
import 'package:http/http.dart' as http;
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:provider/provider.dart';

import '../Model/PageViewModel.dart';
import '../Provider/PageViewFutureState.dart';

SendRequestPageView() async {
  List<PageViewModel> model = [];

  try {
    final response = await http.get(Uri.parse('${dotenv.env['BASEAPI']}/pageViewPics/'));
    var responseData = json.decode(response.body);

    for (var item in responseData['photos']) {
      model.add(PageViewModel(item['id'], item['imgurl']));
    }
    Provider.of<PageViewFutureState>(context as BuildContext, listen: false).PageViewFetched(model);
  } catch (error) {
    // Handle the error here
    print('Error occurred during API request: $error');
  }
}