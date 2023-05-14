import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_item.dart';
import '../repositories/hive/hive_todo_repository.dart';

abstract class IToDoRepository {
  List<ToDoItem> findMany();
  void createOne(ToDoItem toDoItem);
  void updateOne(ToDoItem toDoItem);
  void deleteOne(String id);
}

class ToDoNotifier extends StateNotifier<List<ToDoItem>> {
  late final IToDoRepository _repository;
  ToDoNotifier(this._repository) : super([]) {
    state = _repository.findMany();
  }

  void addToDo(String title, String memo) {
    final todoItem = ToDoItem(
      id: const Uuid().v4(),
      title: title,
      memo: memo,
      createdAt: DateTime.now(),
    );
    _repository.createOne(todoItem);
    state = _repository.findMany();
  }

  void editToDo(ToDoItem toDoItem) {
    _repository.updateOne(toDoItem);
    state = _repository.findMany();
  }

  void removeToDo(String id) {
    _repository.deleteOne(id);
    state = _repository.findMany();
  }
}

final todoNotifierProvider =
    StateNotifierProvider<ToDoNotifier, List<ToDoItem>>(
  (ref) => ToDoNotifier(ref.read(hiveToDoRepositoryProvider)),
);
