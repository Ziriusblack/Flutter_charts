import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'chart_models.dart';

class BasicChartsScreen extends StatelessWidget {
  const BasicChartsScreen({Key? key}) : super(key: key);

  List<ChartSampleData> get _sampleData => [
        ChartSampleData(x: 'Ene', y: 35),
        ChartSampleData(x: 'Feb', y: 28),
        ChartSampleData(x: 'Mar', y: 34),
        ChartSampleData(x: 'Abr', y: 32),
        ChartSampleData(x: 'May', y: 40),
      ];

  Widget _buildChart(int index) {
    final colors = [Colors.blue, Colors.green, Colors.orange, Colors.purple, Colors.red];
    final selectedColor = colors[index % colors.length];

    if (index < 10) {
      return SfCartesianChart(
        title: ChartTitle(text: 'Básica #${index + 1}: Columnas'),
        primaryXAxis: const CategoryAxis(),
        series: <CartesianSeries<ChartSampleData, String>>[
          ColumnSeries<ChartSampleData, String>(
            dataSource: _sampleData,
            xValueMapper: (data, _) => data.x,
            yValueMapper: (data, _) => data.y + (index * 2),
            color: selectedColor,
            dataLabelSettings: DataLabelSettings(isVisible: index.isEven),
          )
        ],
      );
    } else if (index < 20) {
      return SfCartesianChart(
        title: ChartTitle(text: 'Básica #${index + 1}: Línea'),
        primaryXAxis: const CategoryAxis(),
        series: <CartesianSeries<ChartSampleData, String>>[
          LineSeries<ChartSampleData, String>(
            dataSource: _sampleData,
            xValueMapper: (data, _) => data.x,
            yValueMapper: (data, _) => data.y + (index * 3),
            color: selectedColor,
            markerSettings: MarkerSettings(isVisible: index.isOdd),
          )
        ],
      );
    } else if (index < 30) {
      return SfCartesianChart(
        title: ChartTitle(text: 'Básica #${index + 1}: Área'),
        primaryXAxis: const CategoryAxis(),
        series: <CartesianSeries<ChartSampleData, String>>[
          AreaSeries<ChartSampleData, String>(
            dataSource: _sampleData,
            xValueMapper: (data, _) => data.x,
            yValueMapper: (data, _) => data.y + (index * 1.5),
            color: selectedColor.withOpacity(0.6),
          )
        ],
      );
    } else {
      return SfCircularChart(
        title: ChartTitle(text: 'Básica #${index + 1}: Circular'),
        series: <CircularSeries<ChartSampleData, String>>[
          PieSeries<ChartSampleData, String>(
            dataSource: _sampleData,
            xValueMapper: (data, _) => data.x,
            yValueMapper: (data, _) => data.y + index,
            dataLabelSettings: const DataLabelSettings(isVisible: true),
            explode: index.isEven,
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('40 Gráficas Básicas - Syncfusion')),
      body: ListView.builder(
        itemCount: 40,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: SizedBox(
              height: 250,
              child: _buildChart(index),
            ),
          );
        },
      ),
    );
  }
}