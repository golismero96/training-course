import 'package:flutter/foundation.dart';
import '../Model/PageViewModel.dart';

class PageViewFutureState extends ChangeNotifier {
  late List<PageViewModel> _pageViewState;

  List<PageViewModel> get pageViewState => _pageViewState;

  void PageViewFetched(pageViewFuture) {
    _pageViewState = pageViewFuture;
    notifyListeners();
  }
}