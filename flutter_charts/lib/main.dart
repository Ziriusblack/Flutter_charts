import 'package:flutter/material.dart';

import 'core/home_page.dart';

void main() => runApp(const TallerGraphicApp());

class TallerGraphicApp extends StatelessWidget {
  const TallerGraphicApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Taller graphic',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(colorSchemeSeed: Colors.indigo, useMaterial3: true),
      home: const HomePage(),
    );
  }
}
