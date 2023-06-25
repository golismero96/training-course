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
              height: 70,
              width: double.infinity,
              child: Consumer<VenturesFutureProvider>(
                builder: (context, venturesProvider, child) {
                  if(venturesProvider.venturesState == null) {
                    return SizedBox();
                  }
                  else {
                    return FutureBuilder<List<VenturesModel>>(
                                  future: venturesProvider.venturesState,
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

