// ignore_for_file: invalid_use_of_protected_member
import 'package:flutter_test/flutter_test.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'clock_notifier.dart';

void main() {
  late ClockNotifier notifier;
  setUp(() {
    initializeDateFormatting('ja');
    notifier = ClockNotifier();
  });
  test("should be defined", () {
    expect(notifier, isNotNull);
  });

  test("should be updated clodk", () async {
    final startTime = notifier.getDateTimeNow();
    await Future.delayed(const Duration(seconds: 2));
    final endTime = notifier.getDateTimeNow();
    expect(startTime, isNot(endTime));
  });
}
