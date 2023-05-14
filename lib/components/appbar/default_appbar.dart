import 'package:flutter/material.dart';

import '../clock/clock.dart';

class DefaultAppbar extends StatelessWidget implements PreferredSizeWidget {
  const DefaultAppbar({this.title = "", super.key});

  final String title;

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight + 20);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: LayoutBuilder(builder: (context, constraints) {
        if (constraints.maxWidth < 500) {
          return Text(title);
        }
        return Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(title),
            const Clock(),
          ],
        );
      }),
    ); // Your custom widget implementation.
  }
}
