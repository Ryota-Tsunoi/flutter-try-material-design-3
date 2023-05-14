import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'default_scaffold.dart';

void main() {
  setUpAll(() => initializeDateFormatting('ja'));

  testWidgets('should be renderd', (widgetTester) async {
    await widgetTester.runAsync(() async {
      await widgetTester.pumpWidget(
        MaterialApp(
          home: ProviderScope(
            child: DefaultScaffold(
              title: "テストタイトル",
              body: Center(child: Text("テストボディ")),
              floatingActionButton: FloatingActionButton(
                child: Text("テストボタン"),
                onPressed: () {},
              ),
            ),
          ),
        ),
      );
      expect(find.text('テストタイトル'), findsOneWidget);
      expect(find.text('テストボディ'), findsOneWidget);
      expect(find.text('テストボタン'), findsOneWidget);
      expect(find.byIcon(Icons.menu), findsOneWidget);
    });
  });
}
