import 'package:flutter/material.dart';
import 'package:hive_flutter/hive_flutter.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'features/todo/pages/todo_page.dart';
import 'features/todo/repositories/hive/hive_todo_repository.dart';

Future<void> main() async {
  await Hive.initFlutter();
  final box = await Hive.openBox<Map<dynamic, dynamic>>('todo');
  runApp(
    ProviderScope(
      overrides: [
        todoBoxProvider.overrideWithValue(box),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    initializeDateFormatting('ja');
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        primarySwatch: Colors.blue,
      ),
      home: const Home(),
    );
  }
}

class Home extends StatelessWidget {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    return const ToDoPage();
  }
}
