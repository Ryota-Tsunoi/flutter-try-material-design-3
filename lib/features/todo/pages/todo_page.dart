import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../components/scaffold/default_scaffold.dart';
import '../components/todoEdit/todo_edit.dart';
import '../components/todoListTile/todo_list_tile.dart';
import '../notifiers/todo_notifier.dart';

class ToDoPage extends ConsumerWidget {
  const ToDoPage({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final state = ref.watch(todoNotifierProvider);
    return DefaultScaffold(
      title: "TODO一覧",
      body: state.isEmpty
          ? _ToDoEmpty()
          : ListView.separated(
              itemBuilder: (context, index) => ToDoListTile(
                todoItem: state[index],
              ),
              separatorBuilder: (context, index) => const Divider(),
              itemCount: state.length,
            ),
      floatingActionButton: FloatingActionButton(
        child: const Icon(Icons.add),
        onPressed: () {
          showModalBottomSheet(
            context: context,
            isScrollControlled: true,
            builder: (context) {
              return const ToDoEdit();
            },
          );
        },
      ),
    );
  }
}

class _ToDoEmpty extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return const Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.check_circle_outline,
            size: 100,
          ),
          Text(
            "All done!",
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}
