import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:try_material_design_3/components/clock/providers/clock_provider.dart';

class Clock extends ConsumerWidget {
  const Clock({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final clock = ref.watch(clockProvider.select((value) => value));
    return Text(
      clock,
      style: const TextStyle(fontSize: 16, color: Colors.grey),
    );
  }
}
