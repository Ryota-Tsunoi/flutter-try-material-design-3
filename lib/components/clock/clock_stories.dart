import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:intl/date_symbol_data_local.dart';

import 'clock.dart';

Widget Default() {
  initializeDateFormatting('ja');
  return ProviderScope(child: Center(child: Clock()));
}
