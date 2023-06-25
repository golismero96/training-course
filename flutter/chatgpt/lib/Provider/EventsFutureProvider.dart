import 'package:flutter/foundation.dart';
import '../Model/EventsModel.dart';
import '../Model/VenturesModel.dart';

class EventsFutureProvider extends ChangeNotifier {
  late Future<List<EventsModel>> _eventsState;

  Future<List<EventsModel>> get eventsState => _eventsState;

  void EventsFetched(eventsFuture) {
    _eventsState = eventsFuture;
    notifyListeners();
  }
}