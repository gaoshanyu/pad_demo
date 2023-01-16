import 'package:flutter/foundation.dart';

import '../generated/l10n.dart';
import 'current_locale.dart';

class AppLocalizations {
  static S dictionary() {
    return S.current;
  }

  @visibleForTesting
  static void init() {
    S.load(LocaleProvider().value);
  }
}
