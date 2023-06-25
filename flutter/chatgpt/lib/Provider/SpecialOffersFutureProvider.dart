import 'package:flutter/foundation.dart';
import '../Model/SpecialOfferModel.dart';
import '../Model/VenturesModel.dart';

class SpecialOffersFutureProvider extends ChangeNotifier {
  late Future<List<SpecialOfferModel>> _specialOffersState;

  Future<List<SpecialOfferModel>> get specialOffersState => _specialOffersState;

  void SpecialOffersFetched(specialOffersFuture) {
    _specialOffersState = specialOffersFuture;
    notifyListeners();
  }
}