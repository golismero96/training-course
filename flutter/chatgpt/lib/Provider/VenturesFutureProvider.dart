import 'package:flutter/foundation.dart';
import '../Model/VenturesModel.dart';

class VenturesFutureProvider extends ChangeNotifier {
  late Future<List<VenturesModel>> _venturesState;

  Future<List<VenturesModel>> get venturesState => _venturesState;

  void VenturesFetched(venturesFuture) {
    _venturesState = venturesFuture;
    notifyListeners();
  }
}