import 'dart:async';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/intl.dart';

class DateTimeNotifier extends Notifier<String> {
  String _getDateTimeNow() {
    final now = DateTime.now();
    final formatDate = DateFormat.yMMMEd("ja").format(now);
    final formatTime = DateFormat.Hms("ja").format(now);
    return '$formatDate $formatTime';
  }

  @override
  String build() {
    Timer.periodic(const Duration(seconds: 1), (_) {
      state = _getDateTimeNow();
    });
    return _getDateTimeNow();
  }
}

final clockProvider =
    NotifierProvider<DateTimeNotifier, String>(() => DateTimeNotifier());
