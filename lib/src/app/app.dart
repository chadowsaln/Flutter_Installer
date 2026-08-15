import 'package:flutter/material.dart';
import 'package:theme_mode_builder/theme_mode_builder.dart';

import 'package:flutter_installer/src/app/generated/locator/locator.dart';
import 'package:flutter_installer/src/app/services/router_service.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return ThemeModeBuilder(
      builder: (BuildContext context, ThemeMode themeMode) {
        return MaterialApp.router(
          debugShowCheckedModeBanner: false,
          title: 'Flutter Installer',
          routerConfig: locator<RouterService>().router.config(),
          themeMode: themeMode,
          theme: ThemeData(
            brightness: Brightness.light,
            colorScheme: ColorScheme.fromSeed(
              seedColor: const Color(0xff085A9C),
            ),
          ),
          darkTheme: ThemeData(
            brightness: Brightness.dark,
            colorScheme: ColorScheme.fromSeed(
              seedColor: Colors.deepOrangeAccent,
              brightness: Brightness.dark,
            ),
          ),
        );
      },
    );
  }
}
