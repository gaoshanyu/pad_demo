import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.id, required this.background});

  final int id;
  final Color background;

  @override
  Widget build(BuildContext context) {
    String content = 'from page $id';
    if (id == 100) {
      content += ": it's second page left";
    } else if (id % 2 == 0) {
      content += ": it's come from special item";
    }
    return Scaffold(
        appBar: AppBar(title: Text('Page $id')), backgroundColor: background, body: Center(child: Text('Details Page Body: $content')));
  }
}
