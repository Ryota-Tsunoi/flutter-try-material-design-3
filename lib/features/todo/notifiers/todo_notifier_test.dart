// ignore_for_file: invalid_use_of_protected_member
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import '../models/todo_item.dart';
import 'todo_notifier.dart';

class MockRepository extends Mock implements IToDoRepository {
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

  @override
  void deleteOne(String id) {
    mockReturn.removeWhere((element) => element.id == id);
  }
}

void main() {
  late ToDoNotifier notifier;
  setUp(() async {
    notifier = ToDoNotifier(MockRepository());
  });
  test("should be defined", () {
    expect(notifier, isNotNull);
  });

  test("should be add", () {
    notifier.addToDo("title", "memo");
    expect(notifier.state.length, 1);
  });

  test("should be update", () {
    notifier.addToDo("title", "memo");
    expect(notifier.state[0].title, "title");
    notifier.editToDo(
      ToDoItem(
        id: notifier.state[0].id,
        title: "title2",
        memo: "memo2",
        createdAt: notifier.state[0].createdAt,
      ),
    );
    expect(notifier.state[0].title, "title2");
    expect(notifier.state[0].memo, "memo2");
  });

  test("should be delete", () {
    notifier.addToDo("title", "memo");
    expect(notifier.state.length, 1);
    notifier.removeToDo(notifier.state[0].id);
    expect(notifier.state.length, 0);
  });
}
