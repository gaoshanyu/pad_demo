import 'package:flutter/material.dart';
import 'package:pad_demo/adaptive.dart';
import 'package:pad_demo/global_keys.dart';
import 'package:pad_demo/pages/details_page.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  static const numItems = 9;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: isDesktopLayout(context)
            ? null
            : AppBar(
                title: const Text('Second Page Title'),
                leading: InkWell(
                    child: const Icon(Icons.menu),
                    onTap: () {
                      GlobalKeys.rootScaffoldKey.currentState?.openDrawer();
                    }),
              ),
        body: isDesktopLayout(context) ? _buildPadView() : _buildPageBody());
  }

  Widget _buildPadView() {
    return Scaffold(
        appBar: AppBar(title: const Text('Second Page Title')),
        body: _buildPageBody(),
      );
  }

  Widget _buildPageBody() {
    return Center(
          child: ListView.separated(
              itemCount: numItems,
              separatorBuilder: (context, index) => const Divider(height: .5, indent: 12.0, endIndent: 12.0, color: Color(0xFFDDDDDD)),
              itemBuilder: (context, index) => ListTile(
                leading: const Icon(Icons.start),
                title: Text(
                  'Second Item ${index + 1} on Second Page',
                ),
                onTap: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage(id: index + 1, background: Colors.green.withOpacity((100 - index * 3) / 100))));
                  });
                },
              )),
        );
  }

}
