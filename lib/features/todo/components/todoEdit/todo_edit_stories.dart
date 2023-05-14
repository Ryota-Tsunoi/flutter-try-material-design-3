import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:mockito/mockito.dart';

import '../../models/todo_item.dart';
import '../../repositories/hive/hive_todo_repository.dart';
import 'todo_edit.dart';

class MockRepository extends Mock implements HiveToDoRepository {
  List<ToDoItem> mockReturn = [];

  @override
  List<ToDoItem> findMany() {
    return mockReturn;
  }

  @override
  void createOne(ToDoItem toDoItem) {
    mockReturn.add(toDoItem);
  }

  @override
  void updateOne(ToDoItem toDoItem) {
    mockReturn = mockReturn.map((e) {
      if (e.id == toDoItem.id) {
        return toDoItem;
      }
      return e;
    }).toList();
  }
}

Widget Default() {
  return MaterialApp(
    theme: ThemeData(
      useMaterial3: true,
    ),
    home: ProviderScope(
      overrides: [
        hiveToDoRepositoryProvider.overrideWithValue(MockRepository()),
      ],
      child: Center(
        child: ToDoEdit(),
      ),
    ),
  );
}
