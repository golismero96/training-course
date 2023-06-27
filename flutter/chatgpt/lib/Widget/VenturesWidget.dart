import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:resize/resize.dart';
import '../Model/VenturesModel.dart';
import 'dart:convert';

import '../Provider/VenturesFutureProvider.dart';

class VenturesWidget extends StatefulWidget {
  const VenturesWidget({super.key});

  @override
  State<VenturesWidget> createState() => _VenturesWidgetState();
}

class _VenturesWidgetState extends State<VenturesWidget> {
  // VenturesModel venturesController = VenturesFutureProvider();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(vertical: 10),
        child: Container(
            height: 180,
            width: double.infinity,
            child: Consumer<VenturesFutureProvider>(
                builder: (context, venturesProvider, child) {
              if (venturesProvider.venturesState == null) {
                return SizedBox();
              } else {
                return FutureBuilder<List<VenturesModel>>(
                    future: venturesProvider.venturesState,
                    builder: (context, snapshot) {
                      if (snapshot.hasData) {
                        List<VenturesModel>? model = snapshot.data;
                        return Center(
                          child: GridView.builder(
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 4,
                              ),
                              shrinkWrap: true,
                              itemBuilder: (context, position) {
                                return VenturesRenderItem(model[position]);
                              },
                              itemCount: model!.length),
                        );
                      } else {
                        return const Center(child: Text("Loading..."));
                      }
                    });
              }
            })));
  }

  Container VenturesRenderItem(VenturesModel venturesModel) {
    return Container(
      width: 85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(
            venturesModel.imgUrl,
            width: 40,
            height: 40,
          ),
          Container(
            alignment: Alignment.center,
            width: 100,
            height: 25,
            child: Text(utf8.decode(venturesModel.text.toString().codeUnits),
                style: TextStyle(
                    overflow: TextOverflow.ellipsis, fontSize: 9.8.sp)),
          )
        ],
      ),
    );
  }
}
