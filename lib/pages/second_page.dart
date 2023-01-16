import 'package:flutter/material.dart';
import 'package:pad_demo/adaptive.dart';
import 'package:pad_demo/global_keys.dart';
import 'package:pad_demo/pages/details_page.dart';
import 'package:page_transition/page_transition.dart';

class SecondPage extends StatefulWidget {
  const SecondPage({super.key});

  @override
  State<SecondPage> createState() => _SecondPageState();
}

class _SecondPageState extends State<SecondPage> {
  static const numItems = 9;
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Navigator(
      initialRoute: 'second/list',
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name) {
          case 'second/list':
            return MaterialPageRoute<void>(builder: (BuildContext context) => _buildPage(context), settings: settings);
          case 'second/details':
            return PageTransition(
              child: DetailsPage(id: _selectedItem + 1, background: Colors.green),
              type: PageTransitionType.rightToLeft,
              duration: const Duration(milliseconds: 200),
              settings: settings,
            );
          default:
            throw Exception('Invalid route: ${settings.name}');
        }
      },
    );
  }

  Scaffold _buildPage(BuildContext context) {
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
                  _selectedItem = index;
                  Navigator.pushNamed(context, 'second/details');
                },
              )),
    );
  }
}
