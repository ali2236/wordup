import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:wordup/presentation/providers/provider_audio.dart';
import 'app.dart';
import 'core/core.dart';
import 'domain/domain.dart';
import 'presentation/providers/provider_theme.dart';
import 'presentation/providers/provider_accent.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Injector.init(DebugInjector());
  final di = Injector.instance;

  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeProvider(di.get())),
        ChangeNotifierProvider(create: (_) => AccentProvider(di.get())),
        ChangeNotifierProvider(create: (_) => AudioProvider()),
      ],
      child: const MyApp(),
    ),
  );
}
