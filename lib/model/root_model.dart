import 'package:flutter/material.dart';
import 'package:pad_demo/pages/first_page.dart';
import 'package:pad_demo/pages/second_page.dart';

import '../generated/l10n.dart';

enum PageType { first, second }

class Destination {
  const Destination({
    required this.type,
    required this.title,
    required this.icon,
  });

  final PageType type;
  final String title;
  final Icon icon;
}

class RootModel {
  static List<Destination> navigationDestinations(S dictionary) => <Destination>[
    Destination(
      type: PageType.first,
      title: dictionary.firstPage,
      icon: const Icon(Icons.textsms_outlined),
    ),
    Destination(
      type: PageType.second,
      title: dictionary.secondPage,
      icon: const Icon(Icons.book),
    )
  ];

  static List<Widget> pages() => const <Widget>[FirstPage(), SecondPage()];
}
