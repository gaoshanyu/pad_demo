
import 'package:flutter/material.dart';
import 'package:pad_demo/global_keys.dart';
import 'package:pad_demo/pages/root_body.dart';
import 'package:provider/provider.dart';

import '../model/root_model.dart';
import '../model/root_store.dart';

class MobileRootPage extends StatefulWidget {
  const MobileRootPage({
    super.key,
    this.uniqueKey,
    required this.destinations,
    required this.onItemTapped,
  });

  final UniqueKey? uniqueKey;
  final List<Destination> destinations;
  final void Function(int, PageType) onItemTapped;

  @override
  State<MobileRootPage> createState() => _MobileRootPageState();
}

class _MobileRootPageState extends State<MobileRootPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RootStore>(builder: (context, store, child) {
      return Scaffold(
        key: GlobalKeys.rootScaffoldKey,
        drawer: const Drawer(backgroundColor: Color(0xFFF8F8FA), child: Center(child: Text('User Info'))),
        body: RootBody(uniqueKey: widget.uniqueKey),
        bottomNavigationBar: BottomNavigationBar(
          key: GlobalKeys.rootBottomNavigationBarKey,
          items: widget.destinations.map((item) => BottomNavigationBarItem(icon: item.icon, label: item.title)).toList(),
          type: BottomNavigationBarType.fixed,
          fixedColor: const Color(0xFFFC6D26),
          currentIndex: store.selectedPage.index,
          onTap: (index) {
            setState(() {
              widget.onItemTapped(index, widget.destinations[index].type);
            });
          },
        ),
      );
    });
  }
}
