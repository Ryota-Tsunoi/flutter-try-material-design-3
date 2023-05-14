import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'default_appbar.dart';

Widget Default() {
  return ProviderScope(
    child: MaterialApp(
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: DefaultAppbar(
          title: "Monarch story",
        ),
      ),
    ),
  );
}
