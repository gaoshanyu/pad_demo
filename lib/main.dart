import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:pad_demo/l10n/current_locale.dart';
import 'package:pad_demo/theme_color_data.dart';
import 'package:provider/provider.dart';

import 'generated/l10n.dart';
import 'local_storage.dart';
import 'model/root_model.dart';
import 'model/root_store.dart';
import 'pages/root_page.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await LocalStorage.init();
  runApp(const App());
}

class App extends StatefulWidget {
  const App({super.key});

  @override
  State<App> createState() => _AppState();
}

class _AppState extends State<App> with RestorationMixin {
  final _RestorableStarterState _appState = _RestorableStarterState();

  @override
  String get restorationId => 'appState';

  @override
  void restoreState(RestorationBucket? oldBucket, bool initialRestore) {
    registerForRestoration(_appState, 'state');
  }

  @override
  void dispose() {
    _appState.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
        providers: [
          ChangeNotifierProvider<RootStore>.value(value: _appState.value),
          ChangeNotifierProvider(create: (context) => LocaleProvider())
        ],
        child: Consumer<LocaleProvider>(builder: (context, currentLocale, child) {
          return MaterialApp(
            title: 'My App',
            debugShowCheckedModeBanner: false,
            useInheritedMediaQuery: true,
            theme: AppThemeData.lightThemeData,
            darkTheme: AppThemeData.darkThemeData,
            home: const RootPage(),
            localizationsDelegates: const [GlobalMaterialLocalizations.delegate, GlobalCupertinoLocalizations.delegate, GlobalWidgetsLocalizations.delegate, S.delegate],
            supportedLocales: const [Locale('en'), Locale('zh')],
            locale: LocalStorage.get("language", "auto") == "auto" ? currentLocale.value : Locale(LocalStorage.get("language", "auto")),
          );
        }));
  }
}

class _RestorableStarterState extends RestorableListenable<RootStore> {
  @override
  RootStore createDefaultValue() {
    return RootStore();
  }

  @override
  RootStore fromPrimitives(Object? data) {
    final appState = RootStore();
    final appData = Map<String, dynamic>.from(data as Map);
    final pageIndex = appData['selectedPage'] as int;
    appState.selectedPage = PageType.values[pageIndex];
    return appState;
  }

  @override
  Object toPrimitives() {
    return <String, dynamic>{'selectedPage': value.selectedPage.index};
  }
}
