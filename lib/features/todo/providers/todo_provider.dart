import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_item.dart';

class ToDoNotifier extends Notifier<List<ToDoItem>> {
  @override
  List<ToDoItem> build() {
    return [];
  }

  void addToDo(String title, String memo) {
    final addingToDo = ToDoItem(
      id: const Uuid().v4(),
      title: title,
      memo: memo,
      createdAt: DateTime.now(),
    );
    state = [...state, addingToDo];
  }

  void editToDo(ToDoItem toDoItem) {
    state = state.map((e) => e.id == toDoItem.id ? toDoItem : e).toList();
  }

  void removeToDo(String id) {
    state = state.where((e) => e.id != id).toList();
  }
}

final todoProvider = NotifierProvider<ToDoNotifier, List<ToDoItem>>(
  () => ToDoNotifier(),
);
