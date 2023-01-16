#!/usr/bin/env sh

if ! (dart format -l 200 --set-exit-if-changed .); then
  exit 1
fi
flutter pub global activate intl_utils 2.8.1
flutter --no-color pub global run intl_utils:generate
dart format -l 200 .
