import 'package:flutter/material.dart';
import '../Model/VenturesModel.dart';
import 'dart:convert';

class VentureWidget extends StatefulWidget {
  final List<VenturesModel> venturesFuture;
  const VentureWidget(this.venturesFuture, {Key? key}) : super(key: key);

  @override
  State<VentureWidget> createState() => _VentureWidgetState();
}

class _VentureWidgetState extends State<VentureWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 4, // Number of columns
      ),
      itemBuilder: (context, index) {
        VenturesModel venture = widget.venturesFuture[index];
        return Padding(
          padding: const EdgeInsets.all(8.0),
          child: VenturesRenderItem(venture),
        );
      },
      itemCount: widget.venturesFuture!.length,
    );
  }
  Container VenturesRenderItem(VenturesModel venturesModel){
    return Container(
      width: 85,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Image.network(venturesModel.imgUrl, width: 40, height: 40,),
          Text(utf8.decode(venturesModel.text.toString().codeUnits), style: const TextStyle(fontSize: 12))
        ],
      ),
    );
  }
}

