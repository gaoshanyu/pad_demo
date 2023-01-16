import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:pad_demo/l10n/app_localizations.dart';
import 'package:pad_demo/local_storage.dart';
import 'package:pad_demo/main.dart';
import 'package:pad_demo/model/root_model.dart';
import 'package:pad_demo/pages/desktop_root_page.dart';
import 'package:pad_demo/pages/first_page.dart';
import 'package:pad_demo/pages/second_page.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'test_binding_setter.dart';

void main() {
  testWidgets('Should run app in desktop mode with tablet size (1280, 850)', (WidgetTester tester) async {
    AppLocalizations.init();
    SharedPreferences.setMockInitialValues(<String, Object>{});
    await LocalStorage.init();

    await setUpDesktopBinding(tester);

    await tester.pumpWidget(const App());
    await tester.pumpAndSettle();
    await tester.ensureVisible(find.byType(DesktopRootPage));
    expect(find.text('My App'), findsOneWidget);

    await pageTest(0, tester, FirstPage);
    await pageTest(1, tester, SecondPage);

    expect(find.widgetWithText(InkWell, 'User Name'), findsOneWidget);
    await tester.tap(find.widgetWithText(InkWell, 'User Name'));
    await tester.pumpAndSettle();
    expect(find.text('User Info'), findsOneWidget);
  });
}

Future<void> pageTest(int index, WidgetTester tester, Type type) async {
  var navigationDestinations = RootModel.navigationDestinations(AppLocalizations.dictionary());
  var destination = navigationDestinations[index];
  expect(find.byIcon(destination.icon.icon!), findsOneWidget);

  var navigationBarItemFinder = find.byKey(Key(destination.title));
  expect(navigationBarItemFinder, findsOneWidget);
  await tester.pumpAndSettle();
  await tester.ensureVisible(find.byKey(Key(destination.title)));
  await tester.tap(find.byKey(Key(destination.title)));
  expect(find.byType(type), findsOneWidget);
}
