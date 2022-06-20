// ignore_for_file: file_names

import 'package:chat_app/modules/CategoryTitle.dart';
import 'package:chat_app/modules/bloc.dart';
import 'package:flutter/material.dart';

class MySwitch extends StatelessWidget {
  const MySwitch({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  BoolBloc swt = BoolBloc();
    return StreamBuilder<bool>(
      stream: swt.stream$,
      builder: (context, snapshot) {
        return Switch(value: snapshot.data ?? false, onChanged: (val){
          swt.setValue(val);
        }, activeColor: Colors.deepOrange);
      }
    );
  }
}

class MyCheckbox extends StatelessWidget {
  const MyCheckbox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  BoolBloc swt = BoolBloc();
    return StreamBuilder<bool>(
      stream: swt.stream$,
      builder: (context, snapshot) {
        return Checkbox(value: snapshot.data ?? false, onChanged: (val){
          swt.setValue(val!);
        }, activeColor: Colors.deepOrange);
      }
    );
  }
}

class MyDropDownButton extends StatelessWidget {
  final List<DropdownMenuItem<int>> items;
  const MyDropDownButton(this.items, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  IntBloc drp = IntBloc();
    return StreamBuilder<int>(
      stream: drp.stream$,
      builder: (context, snapshot) {
        return DropdownButton<int>(value: snapshot.data ?? 1, items: items, onChanged: (val){
          drp.setValue(val!);
        });
      }
    );
  }
}


