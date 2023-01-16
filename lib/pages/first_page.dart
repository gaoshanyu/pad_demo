import 'package:flutter/material.dart';
import 'package:pad_demo/adaptive.dart';
import 'package:pad_demo/global_keys.dart';
import 'package:pad_demo/pages/details_page.dart';

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  static const numItems = 9;
  int _selectedItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: isDesktopLayout(context)
            ? null
            : AppBar(
                title: const Text('First Page Title'),
                leading: InkWell(
                    child: const Icon(Icons.menu),
                    onTap: () {
                      GlobalKeys.rootScaffoldKey.currentState?.openDrawer();
                    }),
              ),
        body: isDesktopLayout(context) ? Row(children: [_buildDesktopLeftView(), _buildDesktopDetailsView()]) : _buildFirstPageBody());
  }

  Widget _buildDesktopDetailsView() {
    return Expanded(
        child: DetailsPage(
      id: _selectedItem + 1,
      background: Colors.blue.withOpacity((100 - _selectedItem * 2) / 100),
    ));
  }

  Widget _buildDesktopLeftView() {
    return SizedBox(
        width: MediaQuery.of(context).size.width * 0.3,
        child: Scaffold(
          appBar: AppBar(title: const Text('First Page Title')),
          body: _buildFirstPageBody(),
        ));
  }

  Widget _buildFirstPageBody() {
    return Center(
      child: ListView.separated(
          itemCount: numItems,
          separatorBuilder: (context, index) => const Divider(height: .5, indent: 12.0, endIndent: 12.0, color: Color(0xFFDDDDDD)),
          itemBuilder: (context, index) => ListTile(
                // enabled: true,
                selected: index == _selectedItem,
                leading: const Icon(Icons.favorite),
                title: Text(
                  'Item ${index + 1}',
                ),
                onTap: () {
                  setState(() {
                    _selectedItem = index;
                  });
                  if (!isDesktopLayout(context)) {
                    Navigator.of(context).push(MaterialPageRoute(builder: (context) => DetailsPage(id: index + 1, background: Colors.blue.withOpacity((100 - index * 3) / 100))));
                  }
                },
              )),
    );
  }
}
