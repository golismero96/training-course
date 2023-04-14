import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:chatgpt/utils/MyDrawer.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import 'Model/PageViewModel.dart';

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

  PageController pageController = PageController();

  @override
  void initState() {
    super.initState();
    pageViewFuture = SendRequestPageView();
  }
  // Projects/learning/training_course/Django/django_api_react Django

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
              SendRequestPageView();
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
                          alignment: Alignment.center,
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
                              padding: const EdgeInsets.only(bottom: 20),
                              child: SmoothPageIndicator(
                                controller: PageController(),
                                count: model.length,
                                effect: const ExpandingDotsEffect(
                                    dotColor: Colors.white,
                                    activeDotColor: Colors.red,
                                    dotHeight: 10,
                                    dotWidth: 10,
                                    spacing: 5.0),
                                onDotClicked: (index) =>
                                    pageController.animateToPage(
                                  index,
                                  duration: const Duration(milliseconds: 500),
                                  curve: Curves.ease,
                                ),
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
              )
            ],
          )),
    );
  }

  Future<List<PageViewModel>> SendRequestPageView() async {
    List<PageViewModel> model = [];

    var response = await Dio().get('http://192.168.100.7:8000/pageViewPics/');

    for (var item in response.data['photos']) {
      model.add(PageViewModel(item['id'], item['imgurl']));
    }
    return model;
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
}
