import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:json_theme/json_theme.dart';

import 'core/core.dart';

void main() async {
  const String themeRoute = 'assets/theme/bia_flutter_test_theme.json';

  WidgetsFlutterBinding.ensureInitialized();

  final String themeStr = await rootBundle.loadString(themeRoute);
  final Map<String, dynamic> themeJson = jsonDecode(themeStr);
  final ThemeData theme = ThemeDecoder.decodeThemeData(themeJson)!;

  runApp(ProviderScope(child: MyApp(theme: theme)));
}

class MyApp extends StatelessWidget {
  const MyApp({super.key, this.theme});

  final ThemeData? theme;

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerConfig: Routes.router,
      title: 'BIA Flutter Test',
      theme: theme,
    );
  }
}
