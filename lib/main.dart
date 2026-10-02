import 'package:flutter/material.dart';

import 'chart_gallery.dart';

void main() {
  runApp(const ChartGalleryApp());
}

class ChartGalleryApp extends StatelessWidget {
  const ChartGalleryApp({super.key});

  @override
  Widget build(BuildContext context) {
    const ink = Color(0xFF172C2A);
    const green = Color(0xFF237B68);

    return MaterialApp(
      title: 'Atlas de gráficas',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        scaffoldBackgroundColor: const Color(0xFFF4F6F3),
        colorScheme: ColorScheme.fromSeed(
          seedColor: green,
          brightness: Brightness.light,
          surface: const Color(0xFFF4F6F3),
        ),
        fontFamily: 'Segoe UI',
        textTheme: const TextTheme(
          headlineMedium: TextStyle(
            color: ink,
            fontFamily: 'Georgia',
            fontWeight: FontWeight.w700,
          ),
          titleLarge: TextStyle(color: ink, fontWeight: FontWeight.w700),
          titleMedium: TextStyle(color: ink, fontWeight: FontWeight.w600),
          bodyMedium: TextStyle(color: Color(0xFF52615E)),
        ),
      ),
      home: const ChartGalleryScreen(),
    );
  }
}