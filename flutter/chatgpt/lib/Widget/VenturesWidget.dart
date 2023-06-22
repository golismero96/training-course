import 'package:flutter/material.dart';
import '../Model/VenturesModel.dart';
import 'dart:convert';

class VentureWidget extends StatefulWidget {
  final Future<List<VenturesModel>> venturesFuture;
  const VentureWidget(this.venturesFuture, {Key? key}) : super(key: key);

  @override
  State<VentureWidget> createState() => _VentureWidgetState();
}

class _VentureWidgetState extends State<VentureWidget> {
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
              height: 70,
              width: double.infinity,
              child: Consumer<PageViewFutureProvider>(
                builder: (context, pageViewProvider, child) {
                  if(pageViewProvider.pageViewState == null) {
                    return SizedBox();
                  }
                  else {
                    return FutureBuilder<List<VenturesModel>>(
                                  future: venturesFuture,
                                  builder: (context, snapshot) {
                                    if (snapshot.hasData) {
                                      List<VenturesModel>? model =
                                          snapshot.data;
                                      return ListView.builder(
                                          reverse: true,
                                          shrinkWrap: true,
                                          scrollDirection: Axis.horizontal,
                                          itemBuilder: (context, position) {
                                            return VenturesRenderItem(
                                                model[position]);
                                          },
                                          itemCount: model!.length);
                                    } else {
                                      return const Center(
                                          child: Text("Loading..."));
                                    }
                                  }
                                  );
                  }
                }
                )
          )
    );
  }

  Container VenturesRenderItem(VenturesModel venturesModel) {
    return Container(
      width: 85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            venturesModel.imgUrl,
            width: 40,
            height: 40,
          ),
          Text(utf8.decode(venturesModel.text.toString().codeUnits),
              style: TextStyle(fontSize: 4.5.sp))
        ],
      ),
    );
  }
}

