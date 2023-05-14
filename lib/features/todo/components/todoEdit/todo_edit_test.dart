import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hive_test/hive_test.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import '../../models/todo_item.dart';
import '../../repositories/hive/hive_todo_repository.dart';
import 'todo_edit.dart';

void main() {
  late final Box<Map<dynamic, dynamic>> box;

  setUp(() async {
    await setUpTestHive();
    initializeDateFormatting('ja');
    box = await Hive.openBox<Map<dynamic, dynamic>>('todo');
  });

  tearDown(() {
    Hive.deleteBoxFromDisk('todo');
  });

  testWidgets("should be renderd(create)", (widgetTester) async {
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          todoBoxProvider.overrideWithValue(box),
        ],
        child: MaterialApp(home: ToDoEdit()),
      ),
    );
    expect(find.text("タイトル"), findsOneWidget);
  });

  testWidgets("should be renderd(edit)", (widgetTester) async {
    final todoItem = ToDoItem(
      id: "1",
      title: "title",
      memo: "description",
      createdAt: DateTime.now(),
    );
    await widgetTester.pumpWidget(
      ProviderScope(
        overrides: [
          todoBoxProvider.overrideWithValue(box),
        ],
        child: MaterialApp(
          home: ToDoEdit(
            toDoItem: todoItem,
          ),
        ),
      ),
    );
    expect(find.text("title"), findsOneWidget);
  });
}
