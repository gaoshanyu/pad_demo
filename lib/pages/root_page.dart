import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pad_demo/adaptive.dart';
import 'package:provider/provider.dart';

import '../l10n/app_localizations.dart';
import '../model/root_model.dart';
import '../model/root_store.dart';
import 'desktop_root_page.dart';
import 'mobile_root_page.dart';

class RootPage extends StatefulWidget {
  const RootPage({super.key});

  @override
  State<RootPage> createState() => _RootPageState();
}

class _RootPageState extends State<RootPage> {
  final UniqueKey _uniqueKey = UniqueKey();

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final navigationDestinations = RootModel.navigationDestinations(AppLocalizations.dictionary());
    if (isDesktopLayout(context)) {
      return DesktopRootPage(
        uniqueKey: _uniqueKey,
        extended: true,
        destinations: navigationDestinations,
        onItemTapped: _onDestinationSelected,
      );
    }
    return MobileRootPage(
      uniqueKey: _uniqueKey,
      destinations: navigationDestinations,
      onItemTapped: _onDestinationSelected,
    );
  }

  void _onDestinationSelected(int index, PageType destination) {
    var starterStore = Provider.of<RootStore>(context, listen: false);
    starterStore.selectedPage = destination;
  }
}
