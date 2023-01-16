import 'package:flutter/widgets.dart';

import 'root_model.dart';

class RootStore with ChangeNotifier {
  PageType _selectedPage = PageType.first;

  PageType get selectedPage => _selectedPage;

  set selectedPage(PageType page) {
    _selectedPage = page;
    notifyListeners();
  }
}
