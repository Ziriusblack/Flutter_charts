import 'package:flutter/material.dart';

import 'chart_entry.dart';

class ChartDetailPage extends StatelessWidget {
  const ChartDetailPage({super.key, required this.entry});

  final ChartEntry entry;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('#${entry.id} ${entry.title}')),
      body: LayoutBuilder(
        builder: (context, constraints) {
          final aspectRatio = constraints.maxWidth < 600 ? 1.2 : 1.8;
          final chartHeight = (constraints.maxWidth / aspectRatio).clamp(240.0, 360.0).toDouble();

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(entry.description),
                const SizedBox(height: 24),
                SizedBox(
                  width: double.infinity,
                  height: chartHeight,
                  child: entry.builder(),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
