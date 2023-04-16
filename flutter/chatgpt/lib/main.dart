import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt/utils/MyDrawer.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'Model/PageViewModel.dart';
import 'Model/SpecialOfferModel.dart';

void main() {
  runApp(const MaterialApp(
    debugShowCheckedModeBanner: false,
    home: HomePage(),
  ));
}

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late Future<List<PageViewModel>> pageViewFuture;
  late Future<List<SpecialOfferModel>> specialofferFuture;

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewFuture = sendRequestPageView();
    specialofferFuture = sendRequestSpecialOffer();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const Drawer(child: MyDrawer()),
      appBar: AppBar(
        title: const Text('Home Page'),
        backgroundColor: Colors.red,
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              sendRequestPageView();
            },
          ),
          IconButton(
            icon: const Icon(Icons.shopping_cart_outlined),
            onPressed: () {},
          ),
        ],
      ),
      body: Container(
          color: Colors.purple,
          child: Column(
            children: [
              Container(
                height: 200,
                child: FutureBuilder<List<PageViewModel>>(
                    future: pageViewFuture,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<PageViewModel>? model = snapshot.data;
                        return Stack(
                          alignment: Alignment.bottomCenter,
                          children: [
                            PageView.builder(
                              controller: pageController,
                              scrollDirection: Axis.horizontal,
                              allowImplicitScrolling: true,
                              itemCount: model!.length,
                              itemBuilder: (context, position) {
                                return PageViewItems(model[position]);
                              },
                            ),
                            Padding(
                              padding: const EdgeInsets.only(bottom: 10),
                              child: SmoothPageIndicator(
                                controller: PageController(),
                                count: model.length,
                                effect: const ExpandingDotsEffect(
                                  dotColor: Colors.white,
                                  activeDotColor: Colors.red,
                                  dotHeight: 10,
                                  dotWidth: 10,
                                  spacing: 5.0,
                                  expansionFactor: 4,
                                ),
                                onDotClicked: (index) => {
                                  pageController.animateToPage(
                                    index,
                                    duration: const Duration(milliseconds: 500),
                                    curve: Curves.ease,
                                  )
                                },
                              ),
                            )
                          ],
                        );
                      } else {
                        return Center(
                          child: JumpingDotsProgressIndicator(
                            fontSize: 65.0,
                            dotSpacing: 9,
                          ),
                        );
                      }
                    }),
              ),
              Padding(
                  padding: const EdgeInsets.only(bottom: 20),
                  child: Container(
                      color: Colors.red,
                      height: 300,
                      child: FutureBuilder<List<SpecialOfferModel>>(
                          future: specialofferFuture,
                          builder: (context, snapshot) {
                            if (snapshot.hasData) {
                              List<SpecialOfferModel>? model = snapshot.data;
                              return Container();
                            } else {
                              return Center();
                            }
                          })))
            ],
          )),
    );
  }

  Future<List<PageViewModel>> sendRequestPageView() async {
    List<PageViewModel> model = [];

    var response = await Dio().get('http://192.168.100.7:8000/pageViewPics/');

    for (var item in response.data['photos']) {
      model.add(PageViewModel(item['id'], item['imgurl']));
    }
    return model;
  }

  Future<List<SpecialOfferModel>> sendRequestSpecialOffer() async {
    List<SpecialOfferModel> models = [];

    var response = await Dio().get('http://192.168.100.7:8000/specialOffer/');

    print(response.data);
    print(response.statusCode);

    for (var item in response.data['product']) {
      models.add(SpecialOfferModel(
          item['id'],
          item['productName'],
          item['price'],
          item['off_price'],
          item['off_precent'],
          item['imgUrl']));
    }

    return models;
  }

  Padding PageViewItems(PageViewModel pageViewModel) {
    return Padding(
        padding: const EdgeInsets.only(top: 10, left: 5, right: 5),
        child: Container(
          child: ClipRRect(
            borderRadius: BorderRadius.circular(20),
            child: Image.network(pageViewModel.imgurl, fit: BoxFit.fill),
          ),
        ));
  }

  @override
  void dispose() {
    pageController.dispose();
    super.dispose();
  }
}
