import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'chart_models.dart';

class AdvancedChartsScreen extends StatelessWidget {
  const AdvancedChartsScreen({Key? key}) : super(key: key);

  List<ChartSampleData> get _financialData => [
        ChartSampleData(x: DateTime(2026, 10, 1), y: 120, secondY: 90, thirdY: 100, fourthY: 115),
        ChartSampleData(x: DateTime(2026, 10, 2), y: 130, secondY: 110, thirdY: 115, fourthY: 125),
        ChartSampleData(x: DateTime(2026, 10, 3), y: 140, secondY: 105, thirdY: 125, fourthY: 110),
      ];

  Widget _buildAdvancedChart(int index) {
    if (index < 5) {
      return SfCartesianChart(
        title: ChartTitle(text: 'Avanzada #${index + 1}: Velas Japonesas'),
        primaryXAxis: const DateTimeAxis(),
        series: <CandleSeries<ChartSampleData, DateTime>>[
          CandleSeries<ChartSampleData, DateTime>(
            dataSource: _financialData,
            xValueMapper: (data, _) => data.x as DateTime,
            highValueMapper: (data, _) => data.y,
            lowValueMapper: (data, _) => data.secondY,
            openValueMapper: (data, _) => data.thirdY,
            closeValueMapper: (data, _) => data.fourthY,
          )
        ],
      );
    } else if (index < 10) {
      return SfCartesianChart(
        title: ChartTitle(text: 'Avanzada #${index + 1}: Spline Suavizado'),
        primaryXAxis: const CategoryAxis(),
        series: <CartesianSeries<ChartSampleData, String>>[
          SplineAreaSeries<ChartSampleData, String>(
            dataSource: [
              ChartSampleData(x: 'A', y: 10 + index),
              ChartSampleData(x: 'B', y: 40 - index),
              ChartSampleData(x: 'C', y: 25 + index),
            ],
            xValueMapper: (data, _) => data.x as String,
            yValueMapper: (data, _) => data.y,
            color: Colors.teal.withOpacity(0.5),
          )
        ],
      );
    } else if (index < 15) {
      return SfFunnelChart(
        title: ChartTitle(text: 'Avanzada #${index + 1}: Embudo (Funnel)'),
        series: FunnelSeries<ChartSampleData, String>(
          dataSource: [
            ChartSampleData(x: 'Visitas', y: 1000),
            ChartSampleData(x: 'Registro', y: 600 - (index * 20)),
            ChartSampleData(x: 'Compra', y: 200),
          ],
          xValueMapper: (data, _) => data.x as String,
          yValueMapper: (data, _) => data.y,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      );
    } else if (index < 20) {
      return SfPyramidChart(
        title: ChartTitle(text: 'Avanzada #${index + 1}: Pirámide'),
        series: PyramidSeries<ChartSampleData, String>(
          dataSource: [
            ChartSampleData(x: 'Nivel 1', y: 50),
            ChartSampleData(x: 'Nivel 2', y: 100 + (index * 10)),
            ChartSampleData(x: 'Nivel 3', y: 150),
          ],
          xValueMapper: (data, _) => data.x as String,
          yValueMapper: (data, _) => data.y,
          dataLabelSettings: const DataLabelSettings(isVisible: true),
        ),
      );
    } else {
      return SfCartesianChart(
        title: ChartTitle(text: 'Avanzada #${index + 1}: Escalonada (StepLine)'),
        primaryXAxis: const CategoryAxis(),
        series: <CartesianSeries<ChartSampleData, String>>[
          StepLineSeries<ChartSampleData, String>(
            dataSource: [
              ChartSampleData(x: 'Paso 1', y: 10),
              ChartSampleData(x: 'Paso 2', y: 25 + index),
              ChartSampleData(x: 'Paso 3', y: 15),
            ],
            xValueMapper: (data, _) => data.x as String,
            yValueMapper: (data, _) => data.y,
            color: Colors.deepOrange,
          )
        ],
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('25 Gráficas Avanzadas - Syncfusion')),
      body: ListView.builder(
        itemCount: 25,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(10),
            child: SizedBox(
              height: 250,
              child: _buildAdvancedChart(index),
            ),
          );
        },
      ),
    );
  }
}