import 'dart:async';
import 'dart:math';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:dio/dio.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:weather/Model/CurrentCityModel.dart';
import 'package:intl/intl.dart';
import 'package:weather/Model/ForecastDaysModel.dart';

// import 'package:geocoding/geocoding.dart' as GeoCoding;
// import 'package:location/location.dart' as Loc;

class HomeView extends StatefulWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  State<HomeView> createState() => _State();
}

class _State extends State<HomeView> {
  Future<CurrentCityDataModel>? currentWeatherFuture;
  Future<CurrentCityDataModel>? changedCurrentWeatherFuture;
  StreamController<List<ForecastDaysModel>>? StreamForecastdays;
  bool isLoading = false;
  final String API_key = '89bcba8c6272afacbe9318d9958d2616';

  var city_name = 'mashhad';
  var lang_name = 'en';
  final StreamController<int> streamController = StreamController<int>();
  final Random randomNumber = Random(2);
  TextEditingController textEditingController = TextEditingController();

  final textStyle = const TextStyle(fontSize: 50, color: Colors.white);
  final buttonStyle = const TextStyle(fontSize: 36, color: Colors.white);

  @override
  void initState() {
    // streamController.stream.listen((event) {
    //   setState(() {
    //     _randomValue = event;
    //   });
    // });
    // GetLocation();
    super.initState();
    currentWeatherFuture = sendRequestCurrentWeather(city_name);

    StreamForecastdays = StreamController<List<ForecastDaysModel>>();
  }

  @override
  void dispose() {
    streamController.close();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: const Text('DadfarJS Weather'),
        elevation: 15,
        backgroundColor: Colors.grey.shade900,
        actions: <Widget>[
          PopupMenuButton<String>(onSelected: (newValue) {
            if (newValue == 'Refresh') {
              changedCurrentWeatherFuture =
                  sendRequestCurrentWeather(city_name);
              setState(() {
                currentWeatherFuture = changedCurrentWeatherFuture;
              });
            } else if (newValue == 'English' || newValue == 'Persian') {
              if (newValue.contains('English')) {
                setState(() {
                  lang_name = 'en';
                });
              } else if (newValue.contains('Persian')) {
                setState(() {
                  lang_name = 'fa';
                });
              }
              changedCurrentWeatherFuture =
                  sendRequestCurrentWeather(city_name);
              setState(() {
                currentWeatherFuture = changedCurrentWeatherFuture;
              });
            }
          }, itemBuilder: (BuildContext context) {
            return {'Refresh', 'English', 'Persian', 'Logout'}
                .map((String Choice) {
              return PopupMenuItem(
                value: Choice,
                child: Text(Choice),
              );
            }).toList();
          })
        ],
      ),
      body: SafeArea(
          child: FutureBuilder<CurrentCityDataModel>(
              future: currentWeatherFuture,
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  CurrentCityDataModel? cityDataModel = snapshot.data;
                  SendRequest7DaysForecast(
                      cityDataModel!.lat, cityDataModel.lon);
                  return Column(children: [
                    Container(
                      decoration: const BoxDecoration(
                          image: DecorationImage(
                              alignment: Alignment.center,
                              fit: BoxFit.cover,
                              image: AssetImage('images/background.jpg'))),
                      width: double.infinity,
                      // color: Colors.black,
                      // decoration: const BoxDecoration(
                      //   gradient: LinearGradient(
                      //     begin: Alignment.topCenter,
                      //     end: Alignment.bottomCenter,
                      //     colors: [Colors.black, Colors.white],
                      //   ),
                      // ),
                      child: BackdropFilter(
                        filter: ImageFilter.blur(sigmaX: 30, sigmaY: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(10),
                              child: Row(
                                children: [
                                  Expanded(
                                      child: TextField(
                                    controller: textEditingController,
                                    decoration: const InputDecoration(
                                        labelStyle:
                                            TextStyle(color: Colors.white),
                                        hintStyle:
                                            TextStyle(color: Colors.white),
                                        hintText: 'Enter a city name',
                                        border: UnderlineInputBorder()),
                                  )),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  ElevatedButton(
                                    onPressed: () {
                                      if (textEditingController.text != '') {
                                        setState(() {
                                          city_name =
                                              textEditingController.text;
                                        });
                                        changedCurrentWeatherFuture =
                                            sendRequestCurrentWeather(
                                                textEditingController.text);
                                        setState(() {
                                          currentWeatherFuture =
                                              changedCurrentWeatherFuture;
                                        });
                                        textEditingController.text = '';
                                      }
                                    },
                                    style: ElevatedButton.styleFrom(
                                        backgroundColor: Colors.transparent,
                                        shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8.0),
                                        )),
                                    child: const Icon(Icons.search_outlined,
                                        size: 20),
                                    // child: const Text('find', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold),)
                                  ),
                                ],
                              ),
                            ),
                            // Text(_randomValue?.toString() ?? '', style: textStyle),
                            Padding(
                                padding: const EdgeInsets.only(top: 5),
                                child: Center(
                                  child: TextButton(
                                      onPressed: () {
                                        getRandomValue().listen((event) {
                                          streamController.sink.add(event);
                                        });
                                      },
                                      child: Text(cityDataModel.cityname,
                                          style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 26))),
                                )),
                            Padding(
                                padding: const EdgeInsets.only(top: 8),
                                child: Text(cityDataModel.description,
                                    style: TextStyle(
                                        color: Colors.grey.shade400,
                                        fontSize: 16))),
                            Padding(
                                padding: const EdgeInsets.only(top: 15),
                                child:
                                    setIconForMain(cityDataModel.description)),
                            Padding(
                                padding: const EdgeInsets.only(top: 10),
                                child: Text('${cityDataModel.temp}\u00B0',
                                    style: const TextStyle(
                                        color: Colors.white, fontSize: 50))),
                            const SizedBox(
                              height: 10,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Column(
                                  children: [
                                    Text('max',
                                        style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 15)),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                            '${cityDataModel.temp_max}\u00B0',
                                            style: TextStyle(
                                                color: Colors.grey.shade300,
                                                fontSize: 16)))
                                  ],
                                ),
                                Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 15),
                                  child: Container(
                                    width: 1,
                                    height: 30,
                                    color: Colors.grey.shade400,
                                  ),
                                ),
                                Column(
                                  children: [
                                    Text('min',
                                        style: TextStyle(
                                            color: Colors.grey.shade500,
                                            fontSize: 15)),
                                    Padding(
                                        padding: const EdgeInsets.only(top: 10),
                                        child: Text(
                                            '${cityDataModel.temp_min}\u00B0',
                                            style: TextStyle(
                                                color: Colors.grey.shade300,
                                                fontSize: 16)))
                                  ],
                                )
                              ],
                            ),
                            const SizedBox(
                              height: 20,
                            ),
                            Container(
                                width: double.infinity,
                                height: 100,
                                child: Padding(
                                  padding: const EdgeInsets.only(top: 10),
                                  child: Center(
                                    child: ListView.builder(
                                        shrinkWrap: true,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: 10,
                                        itemBuilder:
                                            (BuildContext context, int pos) {
                                          return Container(
                                            height: 50,
                                            width: 70,
                                            child: Card(
                                              elevation: 0,
                                              color: Colors.transparent,
                                              child: Column(
                                                children: [
                                                  const Text('Fri, 8pm',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 12)),
                                                  const SizedBox(
                                                    height: 10,
                                                  ),
                                                  Icon(
                                                      pos % 2 == 0
                                                          ? Icons
                                                              .wb_cloudy_outlined
                                                          : Icons
                                                              .cloudy_snowing,
                                                      color: Colors.white,
                                                      size: 28),
                                                  const SizedBox(
                                                    height: 7,
                                                  ),
                                                  Text(
                                                      '${makeRandomNumber()}\u00B0',
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontSize: 18))
                                                ],
                                              ),
                                            ),
                                          );
                                        }),
                                  ),
                                )),
                            Padding(
                              padding: const EdgeInsets.symmetric(vertical: 25),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Column(
                                    children: [
                                      Text('Wind speed',
                                          style: TextStyle(
                                              color: Colors.grey.shade300,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text('${cityDataModel.windSpeed} m/s',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Container(
                                      width: 1.4,
                                      height: 30,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text('Sunrise',
                                          style: TextStyle(
                                              color: Colors.grey.shade300,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(cityDataModel.sunrise.toString(),
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Container(
                                      width: 1.4,
                                      height: 30,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text('Sunset',
                                          style: TextStyle(
                                              color: Colors.grey.shade300,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text(cityDataModel.sunset.toString(),
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 15),
                                    child: Container(
                                      width: 1.4,
                                      height: 30,
                                      color: Colors.grey.shade400,
                                    ),
                                  ),
                                  Column(
                                    children: [
                                      Text('Humidity',
                                          style: TextStyle(
                                              color: Colors.grey.shade300,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold)),
                                      const SizedBox(
                                        height: 10,
                                      ),
                                      Text('${cityDataModel.humidity}%',
                                          style:
                                              TextStyle(color: Colors.white)),
                                    ],
                                  ),
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                    )
                  ]);
                } else {
                  return Center(
                      child: JumpingDotsProgressIndicator(
                          color: Colors.blueAccent,
                          fontSize: 60,
                          dotSpacing: 2));
                }
              })),
    );
  }

  Future<CurrentCityDataModel> sendRequestCurrentWeather(
      String cityName) async {
    isLoading = true;
    final String baseUrl =
        'https://api.openweathermap.org/data/2.5/weather?q=${cityName}&lang=${lang_name}&appid=${API_key}&units=metric';

    var response = await Dio().get(baseUrl);
    var data = response.data;
    isLoading = false;

    final formatter = DateFormat.jm();
    var sunrise = formatter.format(DateTime.fromMillisecondsSinceEpoch(
        data['sys']['sunrise'] * 1000,
        isUtc: true));
    var sunset = formatter.format(DateTime.fromMillisecondsSinceEpoch(
        data['sys']['sunset'] * 1000,
        isUtc: true));
    var datamodel = CurrentCityDataModel(
        data['name'],
        data['coord']['lon'],
        data['coord']['lat'],
        data['weather'][0]['main'],
        data['weather'][0]['description'],
        data['weather'][0]['icon'],
        data['main']['temp'],
        data['main']['temp_min'],
        data['main']['temp_max'],
        data['main']['pressure'],
        data['main']['humidity'],
        data['main']['speed'],
        data['dt'],
        data['sys']['country'],
        sunrise,
        sunset);
    ScaffoldMessenger.of(context)
        .showSnackBar(SnackBar(content: Text('There is on')));
    return datamodel;
  }

  Image setIconForMain(description) {
    switch (description) {
      case 'clear sky':
        return const Image(
            image: AssetImage('images/icons8-sun-96.png'),
            color: Colors.yellow);
      case 'few clouds':
        return const Image(
            image: AssetImage('images/icons8-partly-cloudy-day-80.png'),
            color: Colors.yellow);
      case 'clouds':
        return const Image(
            image: AssetImage('images/icons8-clouds-80.png'),
            color: Colors.yellow);
      case 'thunderstorm':
        return const Image(
            image: AssetImage('images/icons8-storm-80.png'),
            color: Colors.yellow);
      case 'drizzle':
        return const Image(
            image: AssetImage('images/icons8-cloud-80.png'),
            color: Colors.yellow);
      case 'rain':
        return const Image(
            image: AssetImage('images/icons8-rain-80.png'),
            color: Colors.yellow);
      case 'snow':
        return const Image(
            image: AssetImage('images/icons8-snow-80.png'),
            color: Colors.yellow);
      default:
        return const Image(
            image: AssetImage('images/icons8-windy-weather-80.png'),
            color: Colors.grey);
    }
  }

  Future GetLocation() async {
    // print('GetLocation');

    // Loc.Location location = new Loc.Location();

    // bool _serviceEnabled;
    // Loc.PermissionStatus _permissionGranted;
    // Loc.LocationData _locationData;

    // location.enableBackgroundMode(enable: true);

    // _serviceEnabled = await location.serviceEnabled();
    // if (!_serviceEnabled) {
    //   _serviceEnabled = await location.requestService();
    //   if (!_serviceEnabled) {
    //     return;
    //   }
    // }
    //
    // _permissionGranted = await location.hasPermission();
    // if (_permissionGranted == Loc.PermissionStatus.denied) {
    //   _permissionGranted = await location.requestPermission();
    //   if (_permissionGranted != Loc.PermissionStatus.granted) {
    //     return;
    //   }
    // }

    // _locationData = await location.getLocation();
    // print('latitude: ${_locationData.latitude}');
    // print('longitude: ${_locationData.longitude}');
    //   List<GeoCoding.Placemark> placemarks = await GeoCoding
    //       .placemarkFromCoordinates(
    //       _locationData.latitude!, _locationData.longitude!);
    //   print('placemarks: ${placemarks}');
  }

  void SendRequest7DaysForecast(double lat, double lon) async {
    List<ForecastDaysModel> list = [];
    // print("lat: ${lat} , lon: ${lon} , API_key: ${API_key}");
    try {
      var response = await Dio().get(
          'https://api.openweathermap.org/data/2.5/onecall',
          queryParameters: {
            'lat': lat,
            'lon': lon,
            'exclude': 'minutely,hourly',
            'appid': API_key,
            'units': 'metric'
          });
      var data = response.data;

      final formatter = DateFormat.MMMd();

      for (int i = 0; i < 8; i++) {
        var model = data['daily'][i];
        var dt = formatter.format(DateTime.fromMillisecondsSinceEpoch(
            model['dt'] * 1000,
            isUtc: true));

        ForecastDaysModel forecastDaysModel = ForecastDaysModel(
            dt,
            model['temp']['day'],
            model['weather'][0]['main'],
            model['weather'][0]['description']);
        list.add(forecastDaysModel);
      }
      StreamForecastdays?.add(list);
    } on DioError catch (e) {
      // print(e.response!.statusCode);
      // print(e.message);
    }
  }

  String makeRandomNumber() {
    var random = randomNumber.nextInt(45);
    return random.toString();
  }

  Stream<int> getRandomValue() async* {
    int count = 0;
    while (count <= 10) {
      await Future.delayed(const Duration(seconds: 2));
      yield randomNumber.nextInt(100);
      count++;
    }
  }
}
