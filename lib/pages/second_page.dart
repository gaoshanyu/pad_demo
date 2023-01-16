import 'package:flutter/material.dart';
import 'package:pad_demo/adaptive.dart';
import 'package:pad_demo/global_keys.dart';
import 'package:pad_demo/pages/details_page.dart';

class SecondPage extends StatelessWidget {
  const SecondPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Second Page Title'),
          leading: isDesktopLayout(context)
              ? null
              : InkWell(
                  child: const Icon(Icons.menu),
                  onTap: () {
                    GlobalKeys.rootScaffoldKey.currentState?.openDrawer();
                  },
                ),
        ),
        body: Center(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Second Page Body'),
            InkWell(
              onTap: () {
                Navigator.of(context).push(MaterialPageRoute(builder: (context) => const DetailsPage(contentString: 'Push from Second page')));
              },
              child: Container(
                width: 160,
                height: 40,
                margin: const EdgeInsets.all(20),
                decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)),
                child: const Center(child: Text('Action Button', style: TextStyle(color: Colors.white))),
              ),
            )
          ],
        )));
  }
}