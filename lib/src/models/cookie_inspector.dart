import 'package:flutter/material.dart';

class CookieInspector {
  const CookieInspector({
    this.navigatorKey,
    this.showInspectorOnShake = false,
    this.showNotification = true,
    this.themeMode = ThemeMode.light,
  }) : assert(
          !(showNotification == false && navigatorKey == null),
          'navigatorKey cannot be null',
        );

  final GlobalKey<NavigatorState>? navigatorKey;
  final bool showInspectorOnShake;
  final bool showNotification;
  final ThemeMode themeMode;
}
