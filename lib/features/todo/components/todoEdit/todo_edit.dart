import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:try_material_design_3/features/todo/models/todo_item.dart';

import '../../providers/todo_provider.dart';

class ToDoEdit extends HookConsumerWidget {
  const ToDoEdit({this.toDoItem, super.key});

  final ToDoItem? toDoItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(todoProvider.notifier);
    final titleTextController = useTextEditingController(text: toDoItem?.title);
    final title = toDoItem == null ? "TODO作成" : "TODO編集";
    final submitButtonTitle = toDoItem == null ? "作成" : "更新";

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: titleTextController,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text(submitButtonTitle),
                onPressed: () {
                  if (toDoItem == null) {
                    notifier.addToDo(titleTextController.text);
                  } else {
                    notifier.editToDo(
                      ToDoItem(
                        id: toDoItem!.id,
                        title: titleTextController.text,
                      ),
                    );
                  }
                  Navigator.pop(context);
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text("キャンセル"),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
