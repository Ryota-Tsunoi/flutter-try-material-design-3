import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:try_material_design_3/features/todo/repositories/hive/hive_todo_repository.dart';
import 'package:uuid/uuid.dart';

import '../models/todo_item.dart';

class ToDoNotifier extends Notifier<List<ToDoItem>> {
  late final HiveToDoRepository _repository;
  @override
  List<ToDoItem> build() {
    final box = ref.read(todoBoxProvider);
    _repository = HiveToDoRepository(box);
    return _repository.findMany();
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

final todoProvider = NotifierProvider<ToDoNotifier, List<ToDoItem>>(
  () => ToDoNotifier(),
);
