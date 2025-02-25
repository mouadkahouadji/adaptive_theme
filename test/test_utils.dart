// Copyright © 2020 Birju Vachhani. All rights reserved.
// Use of this source code is governed by an Apache license that can be
// found in the LICENSE file.

import 'package:adaptive_theme/adaptive_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// clears saved theme mode from shared preferences.
Future<void> clearPref() async {
  final pref = await SharedPreferences.getInstance();
  await pref.clear();
}

/// pumps [AdaptiveTheme] and [MaterialApp] with given [light], [dark] and [mode].
Future<void> pumpMaterialApp(
  WidgetTester tester, {
  required ThemeData light,
  required ThemeData dark,
  required AdaptiveThemeMode mode,
}) async {
  await tester.pumpWidget(AdaptiveTheme(
    light: light,
    dark: dark,
    initial: mode,
    builder: (light, dark) => MaterialApp(
      theme: light,
      darkTheme: dark,
      home: Scaffold(
        appBar: AppBar(
          title: const Text('AdaptiveTheme Test'),
        ),
        body: const Center(
          child: Text('Hello'),
        ),
      ),
    ),
  ));
}

/// pumps [CupertinoAdaptiveTheme] and [CupertinoApp] with given [light], [dark] and [mode].
Future<void> pumpCupertinoApp(
  WidgetTester tester, {
  required CupertinoThemeData light,
  required CupertinoThemeData dark,
  required AdaptiveThemeMode mode,
}) async {
  await tester.pumpWidget(CupertinoAdaptiveTheme(
    light: light,
    dark: dark,
    initial: mode,
    builder: (theme) => CupertinoApp(
      theme: theme,
      home: const CupertinoPageScaffold(
        navigationBar: CupertinoNavigationBar(
          middle: Text('Cupertino Example'),
        ),
        child: Center(
          child: Text('Hello'),
        ),
      ),
    ),
  ));
}
