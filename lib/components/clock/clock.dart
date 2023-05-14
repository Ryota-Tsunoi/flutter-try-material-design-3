import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'notifiers/clock_notifier.dart';

class Clock extends ConsumerWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clock = ref.watch(cloclNotifierProvider.select((value) => value));
    return Text(
      clock,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }
}
