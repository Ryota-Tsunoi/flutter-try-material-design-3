import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/todo_item.dart';
import '../../notifiers/todo_notifier.dart';

// id:JSONString<ToDoItem>の形で格納し、RepositoryでToDoItemモデルに変換
final todoBoxProvider = Provider<Box<Map<dynamic, dynamic>>>(
  (ref) => throw UnimplementedError(),
);

final hiveToDoRepositoryProvider = Provider<HiveToDoRepository>(
  (ref) => HiveToDoRepository(ref.read(todoBoxProvider)),
);

class HiveToDoRepository implements IToDoRepository {
  late final Box<Map<dynamic, dynamic>> box;
  HiveToDoRepository(this.box);

  List<ToDoItem> findMany() {
    try {
      final values = box.values.toList();
      return values.map((e) => ToDoItem.fromJson(e.cast())).toList();
    } catch (e) {
      debugPrint(e.toString());
      return [];
    }
  }

  void createOne(ToDoItem toDoItem) {
    box.put(toDoItem.id, toDoItem.toJson());
  }

  void updateOne(ToDoItem toDoItem) {
    box.put(toDoItem.id, toDoItem.toJson());
  }

  void deleteOne(String id) {
    box.delete(id);
  }
}
