import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'presentation/screens/page_main.dart';
import 'presentation/providers/provider_theme.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeProvider = ThemeProvider.watch(context);
    final theme = themeProvider.currentTheme.buildTheme(context);
    
    // Set system UI overlay style based on theme brightness
    SystemChrome.setSystemUIOverlayStyle(
      theme.brightness == Brightness.dark
          ? SystemUiOverlayStyle.light // Light status bar icons for dark theme
          : SystemUiOverlayStyle.dark, // Dark status bar icons for light theme
    );

    return MaterialApp(
      title: 'WordUp',
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: const MainPage(),
    );
  }
}
