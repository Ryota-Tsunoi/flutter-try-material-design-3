import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/todo_item.dart';
import '../../providers/todo_provider.dart';
import '../todoEdit/todo_edit.dart';

class ToDoListTile extends ConsumerWidget {
  const ToDoListTile({required this.todoItem, super.key});

  final ToDoItem todoItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(todoProvider.notifier);
    return Padding(
      padding: const EdgeInsets.fromLTRB(8, 0, 8, 0),
      child: Card(
        child: ListTile(
          title: Text(todoItem.title),
          subtitle: Text(
            todoItem.id,
            style: const TextStyle(
              color: Colors.grey,
              fontSize: 12,
            ),
          ),
          trailing: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                icon: const Icon(Icons.edit),
                onPressed: () {
                  showModalBottomSheet(
                    context: context,
                    isScrollControlled: true,
                    builder: (context) {
                      return ToDoEdit(
                        toDoItem: todoItem,
                      );
                    },
                  );
                },
              ),
              IconButton(
                icon: const Icon(Icons.delete),
                onPressed: () {
                  notifier.removeToDo(todoItem.id);
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
