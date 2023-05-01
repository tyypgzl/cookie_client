import 'package:example/view/valorant_view.dart';
import 'package:flutter/material.dart';

void main() => runApp(const MyApp());

GlobalKey<NavigatorState> navigatorKey = GlobalKey<NavigatorState>();

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      themeMode: ThemeMode.light,
      theme: ThemeData.light(),
      darkTheme: ThemeData.dark(),
      navigatorKey: navigatorKey,
      debugShowCheckedModeBanner: false,
      title: 'Cookie App',
      home: const CookieView(),
    );
  }
}
