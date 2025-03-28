// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:provider/provider.dart';
import 'package:wordup/app.dart';
import 'package:wordup/core/core.dart';
import 'package:wordup/domain/domain.dart';
import 'package:wordup/presentation/providers/provider_accent.dart';
import 'package:wordup/presentation/providers/provider_audio.dart';
import 'package:wordup/presentation/providers/provider_theme.dart';

void main() {
  testWidgets('Word Test', (WidgetTester tester) async {
    await Injector.init(DebugInjector());
    final di = Injector.instance;

    // Build our app and trigger a frame.
    await tester.pumpWidget(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(create: (_) => ThemeProvider(di.get())),
          ChangeNotifierProvider(create: (_) => AccentProvider(di.get())),
          ChangeNotifierProvider(create: (_) => AudioProvider()),
        ],
        child: const MyApp(),
      ),
    );

    // Verify that our counter starts at 0.
    expect(find.text('0'), findsOneWidget);
    expect(find.text('1'), findsNothing);

    // Tap the '+' icon and trigger a frame.
    await tester.tap(find.byIcon(Icons.add));
    await tester.pump();

    // Verify that our counter has incremented.
    expect(find.text('0'), findsNothing);
    expect(find.text('1'), findsOneWidget);
  });
}
