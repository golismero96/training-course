

Future<List<VenturesModel>> VenturesRender() async {
  List<VenturesModel> models = [];
  try {
    final response =
    await http.get(Uri.parse('${baseAPI}/events/venturesRender/'));
    var responseData = json.decode(response.body);

    for (var model in responseData['ventures']) {
      models.add(VenturesModel(model['text'], model['imgurl']));
    }
    return models;
  } catch (error) {
    // Handle the error here
    print('Error occurred during API request: $error');
    return []; // Or you can return a default value or handle it in a different way
  }
}