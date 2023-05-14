import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'default_appbar.dart';

void main() {
  setUpAll(() => initializeDateFormatting('ja'));

  testWidgets('should be renderd', (widgetTester) async {
    await widgetTester.runAsync(() async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            child: Scaffold(
              appBar: DefaultAppbar(
                title: "テストタイトル",
              ),
            ),
          ),
        ),
      );
      expect(find.text('テストタイトル'), findsOneWidget);
    });
  });
}
