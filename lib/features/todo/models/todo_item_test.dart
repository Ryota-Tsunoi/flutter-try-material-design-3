import 'package:flutter_test/flutter_test.dart';
import 'package:uuid/uuid.dart';

import 'todo_item.dart';

void main() {
  test("should be defined", () {
    final todoItem = ToDoItem(
      id: Uuid.NAMESPACE_X500,
      title: "title",
      memo: "description",
      createdAt: DateTime.now(),
    );
    expect(todoItem, isNotNull);
  });
}
