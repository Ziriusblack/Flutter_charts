// This is a basic Flutter widget test.
//
// To perform an interaction with a widget in your test, use the WidgetTester
// utility in the flutter_test package. For example, you can send tap and scroll
// gestures. You can also use WidgetTester to find child widgets in the widget
// tree, read text, and verify that the values of widget properties are correct.

import 'package:flutter_test/flutter_test.dart';

import 'package:flutter/material.dart';
import 'package:community_charts_gallery/chart_gallery.dart';
import 'package:community_charts_gallery/main.dart';

void main() {
  test('la colección cumple las cantidades del taller', () {
    expect(basicChartExamples, hasLength(40));
    expect(advancedChartExamples, hasLength(25));
  });

  testWidgets('la galería muestra sus contadores y permite buscar', (tester) async {
    tester.view.physicalSize = const Size(1280, 900);
    tester.view.devicePixelRatio = 1;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    await tester.pumpWidget(const ChartGalleryApp());
    await tester.pumpAndSettle();

    expect(find.text('Atlas de gráficas'), findsOneWidget);
    expect(find.text('40'), findsWidgets);
    expect(find.text('25'), findsWidgets);

    await tester.enterText(find.byType(TextField), 'taquilla');
    await tester.pumpAndSettle();
    expect(find.text('Ingresos de taquilla'), findsOneWidget);
  });
}
