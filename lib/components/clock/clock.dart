import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:try_material_design_3/components/clock/notifiers/clock_notifier.dart';

class Clock extends ConsumerWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clock = ref.watch(clockNotifierProvider.select((value) => value));
    return Text(
      clock,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }
}
