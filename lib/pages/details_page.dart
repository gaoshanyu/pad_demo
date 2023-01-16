import 'package:flutter/material.dart';

class DetailsPage extends StatelessWidget {
  const DetailsPage({super.key, required this.contentString});

  final String contentString;

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: AppBar(title: Text(contentString)), body: Center(child: Text('Details Page Body: $contentString')));
  }
}
