import 'package:flutter/material.dart';
import 'package:try_material_design_3/components/appbar/default_appbar.dart';

class DefaultScaffold extends StatelessWidget {
  const DefaultScaffold({
    required this.title,
    required this.body,
    super.key,
  });

  final String title;
  final Widget body;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppbar(title: title),
      drawer: const Drawer(),
      body: body,
    );
  }
}
