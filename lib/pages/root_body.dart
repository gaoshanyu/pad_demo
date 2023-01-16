import 'package:flutter/material.dart';
import 'package:pad_demo/model/root_model.dart';
import 'package:pad_demo/model/root_store.dart';
import 'package:provider/provider.dart';

class RootBody extends StatelessWidget {
  const RootBody({super.key, this.uniqueKey});

  final UniqueKey? uniqueKey;

  @override
  Widget build(BuildContext context) {
    return Consumer<RootStore>(builder: (context, store, child) {
      return IndexedStack(
        key: uniqueKey,
        index: store.selectedPage.index,
        children: RootModel.pages(),
      );
    });
  }
}
