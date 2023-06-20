import 'package:flutter/foundation.dart';
import '../Model/PageViewModel.dart';

class PageViewFutureProvider extends ChangeNotifier {
  late Future<List<PageViewModel>> _pageViewState;

  Future<List<PageViewModel>> get pageViewState => _pageViewState;

  void PageViewFetched(pageViewFuture) {
    _pageViewState = pageViewFuture;
    notifyListeners();
  }
}