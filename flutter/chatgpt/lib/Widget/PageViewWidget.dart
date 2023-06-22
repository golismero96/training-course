import 'package:flutter/material.dart';
import 'package:progress_indicators/progress_indicators.dart';
import 'package:provider/provider.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '../Model/PageViewModel.dart';
import '../Provider/PageViewFutureProvider.dart';
import '../Requests/PageView.dart';

class PageViewWidget extends StatefulWidget {
  const PageViewWidget({super.key});

  @override
  State<PageViewWidget> createState() => _PageViewWidgetState();
}

class _PageViewWidgetState extends State<PageViewWidget> {

  PageController pageController = PageController();


  @override
  void initState() {
    super.initState();
  }
  @override
  void dispose() {
    super.dispose();
    pageController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child:
        Consumer<PageViewFutureProvider>(
          builder: (context, pageViewProvider, child) {
            if(pageViewProvider.pageViewState == null) {
              return SizedBox();
            }
            else {
              return FutureBuilder<List<PageViewModel>>(
                future: pageViewProvider.pageViewState ??
                    SendRequestPageView(context),
                builder: (context, snapshot) {
                  if (snapshot.hasData) {
                    List<PageViewModel> model = snapshot.data!;
                    return Stack(
                      alignment: Alignment.bottomCenter,
                      children: [
                        PageView.builder(
                          reverse: true,
                          controller: pageController,
                          scrollDirection: Axis.horizontal,
                          allowImplicitScrolling: true,
                          itemCount: model!.length,
                          itemBuilder: (context, position) {
                            return PageViewItems(model[position]);
                          },
                        ),
                        Padding(
                          padding:
                          const EdgeInsets.only(bottom: 10),
                          child: SmoothPageIndicator(
                            textDirection: TextDirection.rtl,
                            controller: PageController(),
                            count: model.length,
                            effect: const ExpandingDotsEffect(
                              dotColor: Colors.white,
                              activeDotColor: Colors.red,
                              dotHeight: 10,
                              dotWidth: 8,
                              spacing: 5.0,
                              expansionFactor: 4,
                            ),
                            onDotClicked: (index) =>
                            {
                              pageController.animateToPage(
                                index,
                                duration: const Duration(
                                    milliseconds: 500),
                                curve: Curves.ease,
                              )
                            },
                          ),
                        )
                      ],
                    );
                  } else {
                    return Container(
                        color: Colors.grey[400],
                        child: Stack(
                            alignment: Alignment.center,
                            children: [
                              Image.asset('images/notImage.png'),
                              JumpingDotsProgressIndicator(
                                fontSize: 65.0,
                              ),
                            ]));
                  }
                },);
            }
          },
      )
    );
  }

  Padding PageViewItems(PageViewModel pageViewModel) {
    return Padding(
        padding: const EdgeInsets.all(5.0),
        child: ClipRRect(
            borderRadius: BorderRadiusGeometry.lerp(
                BorderRadius.circular(10.0), BorderRadius.circular(10.0), 10),
            child: Container(
              child: Image.network(pageViewModel.imgurl, fit: BoxFit.fill),
            )));
  }
}
