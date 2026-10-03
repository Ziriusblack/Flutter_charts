import 'package:flutter/material.dart';

import 'chart_detail_page.dart';
import 'chart_entry.dart';
import 'registry.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final basic = chartsOf(ChartLevel.basic);
    final advanced = chartsOf(ChartLevel.advanced);

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Taller graphic'),
          bottom: TabBar(
            tabs: [
              Tab(text: 'Básicas ${basic.length}/50'),
              Tab(text: 'Avanzadas ${advanced.length}/30'),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            _ChartList(charts: basic),
            _ChartList(charts: advanced),
          ],
        ),
      ),
    );
  }
}

class _ChartList extends StatelessWidget {
  const _ChartList({required this.charts});

  final List<ChartEntry> charts;

  @override
  Widget build(BuildContext context) {
    // Agrupa por categoría conservando el orden de aparición.
    final byCategory = <String, List<ChartEntry>>{};
    for (final c in charts) {
      byCategory.putIfAbsent(c.category, () => []).add(c);
    }

    return ListView(
      children: [
        for (final entry in byCategory.entries)
          ExpansionTile(
            initiallyExpanded: true,
            title: Text('${entry.key} (${entry.value.length})'),
            children: [
              for (final chart in entry.value)
                ListTile(
                  leading: CircleAvatar(child: Text('${chart.id}')),
                  title: Text(chart.title),
                  trailing: chart.isCombined ? const Text('⊕') : null,
                  onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => ChartDetailPage(entry: chart),
                    ),
                  ),
                ),
            ],
          ),
      ],
    );
  }
}
