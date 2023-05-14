import 'package:flutter_test/flutter_test.dart';
import 'package:hive/hive.dart';
import 'package:hive_test/hive_test.dart';

import './hive_todo_repository.dart';
import '../../models/todo_item.dart';

void main() {
  late HiveToDoRepository repository;
  setUp(() async {
    await setUpTestHive();
    final box = await Hive.openBox<Map<dynamic, dynamic>>('todo');
    repository = HiveToDoRepository(box);
  });
  tearDown(() {
    Hive.deleteBoxFromDisk('todo');
  });
  test("should be defined", () {
    expect(repository, isNotNull);
  });

  test("should be create", () {
    repository.createOne(
      ToDoItem(id: "A", title: "B", createdAt: DateTime.now()),
    );
    final todoItems = repository.findMany();
    expect(todoItems.length, 1);
  });
  test("should be delete", () {
    repository.createOne(
      ToDoItem(id: "A", title: "B", createdAt: DateTime.now()),
    );
    final todoItems = repository.findMany();
    expect(todoItems.length, 1);
    repository.deleteOne("A");
    final todoItems2 = repository.findMany();
    expect(todoItems2.length, 0);
  });
}
