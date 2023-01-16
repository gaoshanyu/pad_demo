// Copyright 2019 The Flutter team. All rights reserved.
// Use of this source code is governed by a BSD-style license that can be
// found in the LICENSE file.

import 'package:adaptive_breakpoints/adaptive_breakpoints.dart';
import 'package:flutter/material.dart';

/// The maximum width taken up by each item on the home screen.
const maxHomeItemWidth = 1400.0;

/// Returns a boolean value whether the window is considered medium or large size.
///
/// Used to build adaptive and responsive layouts.
bool isDisplayDesktop(BuildContext context) => getWindowType(context) >= AdaptiveWindowType.small;

/// Returns boolean value whether the window is considered medium size.
///
/// Used to build adaptive and responsive layouts.
bool isDisplaySmallDesktop(BuildContext context) {
  return getWindowType(context) == AdaptiveWindowType.small;
}

bool isDesktopLayout(BuildContext context) => MediaQuery.of(context).size.shortestSide >= 600.0;
