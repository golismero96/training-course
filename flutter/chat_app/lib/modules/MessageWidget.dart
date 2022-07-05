// ignore_for_file: file_names

import 'package:flutter/material.dart';

import 'CategoryTitle.dart';
import 'UserWidget.dart';

class MessageWidget extends StatelessWidget {
  MessageWidget({
    Key? key,
    required this.family,
    this.username = '',
    this.msg = '',
    required this.pic,
    this.time = '',
    this.count = 0,
    this.callVideo = true,
  }) : super(key: key);

  final String family;
  String username;
  String msg;
  final String pic;
  String time;
  int count;
  bool callVideo;

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 15),
        child: Row(
          children: [
            UserWidget(pic, family, showFamily: false),
            const SizedBox(
              width: 10,
            ),
            Expanded(
                child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CategoryTitle(family, Colors.black87, 18),
                const SizedBox(
                  height: 10,
                ),
                if (msg != "") ...{
                  CategoryTitle(msg, Colors.black54, 15,
                      overflow: TextOverflow.ellipsis)
                },
                if (username != "") ...{
                  CategoryTitle(username, Colors.black54, 15,
                      overflow: TextOverflow.ellipsis)
                },
              ],
            )),
            Column(
              children: [
                if (time != '')
                  CategoryTitle(
                    time,
                    Colors.black38,
                    13,
                  ),
                const SizedBox(
                  height: 10,
                ),
                if (count != 0) ...{
                  CircleAvatar(
                      backgroundColor: Colors.yellow[900],
                      radius: 15,
                      child: CategoryTitle('$count', Colors.white, 12))
                }
              ],
            ),
            if (callVideo) ...{
              Padding(
                padding: const EdgeInsets.only(top: 5, left: 10, right: 5),
                child: Icon(
                  Icons.camera_alt_outlined,
                  color: Colors.grey[600],
                  size: 33,
                ),
              )
            },
          ],
        ));
  }
}
