import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../Model/EventsModel.dart';
import '../Provider/EventsFutureProvider.dart';

class EventsWidget extends StatefulWidget {
  const EventsWidget({super.key});

  @override
  State<EventsWidget> createState() => _EventsWidgetState();
}

class _EventsWidgetState extends State<EventsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 320,
      width: double.infinity,
      child: Consumer<EventsFutureProvider>(
      builder: (context, eventsProvider, child) {
    if (eventsProvider.eventsState == null) {
      return const SizedBox();
    } else {
      return
        FutureBuilder<List<EventsModel>>(
            future: eventsProvider.eventsState,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                List<EventsModel>? model = snapshot.data;
                return Container(
                  height: 200,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Padding(
                        padding:
                        const EdgeInsets.only(top: 10.0),
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceEvenly,
                          children: [
                            Container(
                              height: 140,
                              child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10.0),
                                  child: Image.network(
                                      model![0].imgUrl,
                                      fit: BoxFit.fill,
                                      width: 170)),
                            ),
                            Container(
                              height: 140,
                              child: ClipRRect(
                                  borderRadius:
                                  BorderRadius.circular(
                                      10.0),
                                  child: Image.network(
                                      model![1].imgUrl,
                                      fit: BoxFit.fill,
                                      width: 170)),
                            ),
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 140,
                            child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(10.0),
                                child: Image.network(
                                    model![2].imgUrl,
                                    fit: BoxFit.fill,
                                    width: 170)),
                          ),
                          Container(
                            height: 140,
                            child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(10.0),
                                child: Image.network(
                                    model![3].imgUrl,
                                    fit: BoxFit.fill,
                                    width: 170)),
                          ),
                        ],
                      )
                    ],
                  ),
                );
              } else {
                return const Center(child: Text("Loading..."));
              }
            });
    }}));
  }
}
