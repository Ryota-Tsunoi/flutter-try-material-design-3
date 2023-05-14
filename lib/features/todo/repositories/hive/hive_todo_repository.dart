import 'package:flutter/foundation.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:try_material_design_3/features/todo/models/todo_item.dart';

// id:JSONString<ToDoItem>の形で格納し、RepositoryでToDoItemモデルに変換
final todoBoxProvider = Provider<Box<Map<dynamic, dynamic>>>(
  (ref) => throw UnimplementedError(),
);

class HiveToDoRepository {
  final Box<Map<dynamic, dynamic>> box;
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
