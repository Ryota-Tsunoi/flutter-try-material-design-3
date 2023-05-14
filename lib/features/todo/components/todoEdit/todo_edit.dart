import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../models/todo_item.dart';
import '../../notifiers/todo_notifier.dart';

class ToDoEdit extends HookConsumerWidget {
  const ToDoEdit({this.toDoItem, super.key});

  final ToDoItem? toDoItem;

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final notifier = ref.watch(todoNotifierProvider.notifier);
    final titleTextController = useTextEditingController(text: toDoItem?.title);
    final memoTextController = useTextEditingController(text: toDoItem?.memo);
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
              decoration: const InputDecoration(
                labelText: "タイトル",
                labelStyle: TextStyle(color: Colors.grey),
              ),
              controller: titleTextController,
            ),
            TextField(
              decoration: const InputDecoration(
                labelText: "メモ",
                labelStyle: TextStyle(color: Colors.grey),
              ),
              keyboardType: TextInputType.multiline,
              maxLines: null,
              controller: memoTextController,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                child: Text(submitButtonTitle),
                onPressed: () {
                  if (toDoItem == null) {
                    notifier.addToDo(
                      titleTextController.text,
                      memoTextController.text,
                    );
                  } else {
                    notifier.editToDo(
                      toDoItem!.copyWith(
                        title: titleTextController.text,
                        memo: memoTextController.text,
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
