import 'package:flutter/material.dart';
import 'package:pad_demo/pages/root_body.dart';
import 'package:provider/provider.dart';

import '../model/root_model.dart';
import '../model/root_store.dart';

class DesktopRootPage extends StatefulWidget {
  const DesktopRootPage({
    super.key,
    this.uniqueKey,
    required this.extended,
    required this.destinations,
    required this.onItemTapped,
  });

  final bool extended;
  final UniqueKey? uniqueKey;
  final List<Destination> destinations;
  final void Function(int, PageType) onItemTapped;

  @override
  State<DesktopRootPage> createState() => _DesktopRootPageState();
}

class _DesktopRootPageState extends State<DesktopRootPage> {
  @override
  Widget build(BuildContext context) {
    return Consumer<RootStore>(builder: (context, store, child) {
      return Scaffold(
        body: SafeArea(
          top: false,
          bottom: false,
          child: Row(
            children: [
              SizedBox(
                width: 240,
                child: Stack(children: [_buildNavigationItemsView(store), _buildBottomUserInfoBox(context)]),
              ),
              const VerticalDivider(thickness: 1, width: 1),
              Expanded(child: RootBody(uniqueKey: widget.uniqueKey)),
            ],
          ),
        ),
      );
    });
  }

  Widget _buildNavigationItemsView(RootStore store) {
    return SingleChildScrollView(
        physics: const ScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 20),
            const ListTile(title: Text('My App', style: TextStyle(fontSize: 32))),
            const Divider(),
            ...widget.destinations.map((item) => ListTile(
                  key: Key(item.title),
                  enabled: true,
                  selected: store.selectedPage == item.type,
                  leading: item.icon,
                  title: Text(item.title),
                  onTap: () {
                    setState(() {
                      widget.onItemTapped(widget.destinations.indexOf(item), item.type);
                    });
                  },
                )),
          ],
        ));
  }

  Widget _buildBottomUserInfoBox(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Divider(),
          InkWell(
            onTap: () {
              double horizontalPadding = MediaQuery.of(context).size.width * 0.1;
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => Scaffold(
                    appBar: AppBar(leading: const BackButton(color: Colors.black)),
                    body: Container(
                      padding: EdgeInsets.fromLTRB(horizontalPadding, 0, horizontalPadding, 40.0),
                      child: const Center(child: Text('User Info')),
                    )),
              ));
            },
            child: Row(
              children: [
                const SizedBox(width: 16),
                const SizedBox(
                  height: 32,
                  child: Icon(Icons.people, size: 34),
                ),
                const SizedBox(width: 10),
                Text('User Name', style: Theme.of(context).textTheme.titleLarge)
              ],
            ),
          )
        ],
      ),
    );
  }
}
