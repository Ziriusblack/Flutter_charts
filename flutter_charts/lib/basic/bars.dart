import 'package:flutter/material.dart';
import 'package:graphic/graphic.dart';

import '../core/chart_entry.dart';
import '../data/sample_data.dart';

const _cat = 'Barras';

final List<ChartEntry> basicBars = [
  ChartEntry(
    id: 1,
    title: 'Barras verticales simples',
    description: 'IntervalMark con una variable categórica y una numérica.',
    category: _cat,
    level: ChartLevel.basic,
    builder: barSimple,
  ),
  ChartEntry(
    id: 2,
    title: 'Barras horizontales',
    description: 'RectCoord con transposed: true.',
    category: _cat,
    level: ChartLevel.basic,
    builder: barHorizontal,
  ),
  ChartEntry(
    id: 3,
    title: 'Barras agrupadas',
    description: 'Compara dos canales dentro de cada género con DodgeModifier.',
    category: _cat,
    level: ChartLevel.basic,
    builder: barGrouped,
  ),
  ChartEntry(
    id: 4,
    title: 'Barras apiladas',
    description: 'Descompone cada género por clientes nuevos y recurrentes.',
    category: _cat,
    level: ChartLevel.basic,
    builder: barStacked,
  ),
  ChartEntry(
    id: 5,
    title: 'Barras de rango',
    description: 'Muestra el mínimo y máximo de cada trimestre.',
    category: _cat,
    level: ChartLevel.basic,
    builder: barRange,
  ),
  ChartEntry(
    id: 6,
    title: 'Embudo de conversión',
    description: 'Representa la caída entre pasos del proceso comercial.',
    category: _cat,
    level: ChartLevel.basic,
    builder: barFunnel,
  ),
];

// 1
Widget barSimple() => Chart(
  data: salesByGenre,
  variables: {
    'genre': Variable(accessor: (Map m) => m['genre'] as String),
    'sold': Variable(
      accessor: (Map m) => m['sold'] as num,
      scale: LinearScale(min: 0),
    ),
  },
  marks: [IntervalMark()],
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

// 2
Widget barHorizontal() => Chart(
  data: salesByGenre,
  variables: {
    'genre': Variable(accessor: (Map m) => m['genre'] as String),
    'sold': Variable(
      accessor: (Map m) => m['sold'] as num,
      scale: LinearScale(min: 0),
    ),
  },
  marks: [IntervalMark()],
  coord: RectCoord(transposed: true),
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

Widget barGrouped() => Chart(
  data: groupedSales,
  variables: {
    'genre': Variable(accessor: (Map m) => m['genre'] as String),
    'channel': Variable(accessor: (Map m) => m['channel'] as String),
    'value': Variable(
      accessor: (Map m) => m['value'] as num,
      scale: LinearScale(min: 0),
    ),
  },
  marks: [
    IntervalMark(
      position: Varset('genre') * Varset('value') / Varset('channel'),
      modifiers: [DodgeModifier()],
    ),
  ],
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

Widget barStacked() => Chart(
  data: stackedSales,
  variables: {
    'genre': Variable(accessor: (Map m) => m['genre'] as String),
    'channel': Variable(accessor: (Map m) => m['channel'] as String),
    'value': Variable(
      accessor: (Map m) => m['value'] as num,
      scale: LinearScale(min: 0),
    ),
  },
  marks: [
    IntervalMark(
      position: Varset('genre') * Varset('value') / Varset('channel'),
      color: ColorEncode(variable: 'channel', values: Defaults.colors10),
      modifiers: [StackModifier()],
    ),
  ],
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

Widget barRange() => Chart(
  data: intervalData,
  variables: {
    'period': Variable(accessor: (Map m) => m['period'] as String),
    'min': Variable(
      accessor: (Map m) => m['min'] as num,
      scale: LinearScale(min: 0, max: 100),
    ),
    'max': Variable(
      accessor: (Map m) => m['max'] as num,
      scale: LinearScale(min: 0, max: 100),
    ),
  },
  marks: [
    IntervalMark(position: Varset('period') * (Varset('min') + Varset('max'))),
  ],
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

Widget barFunnel() => Chart(
  data: funnelData,
  variables: {
    'step': Variable(accessor: (Map m) => m['step'] as String),
    'value': Variable(
      accessor: (Map m) => m['value'] as num,
      scale: LinearScale(min: -1000, max: 1000),
    ),
  },
  marks: [
    IntervalMark(
      position: Varset('step') * Varset('value'),
      shape: ShapeEncode(value: FunnelShape()),
      color: ColorEncode(variable: 'step', values: Defaults.colors10),
      modifiers: [SymmetricModifier()],
    ),
  ],
  coord: RectCoord(transposed: true, verticalRange: [1, 0]),
  axes: [Defaults.horizontalAxis, Defaults.verticalAxis],
);

Widget barPie() => Chart(
  data: salesByGenre,
  variables: {
    'genre': Variable(accessor: (Map m) => m['genre'] as String),
    'sold': Variable(accessor: (Map m) => m['sold'] as num),
  },
  transforms: [Proportion(variable: 'sold', as: 'percent')],
  marks: [
    IntervalMark(
      position: Varset('percent') / Varset('genre'),
      color: ColorEncode(variable: 'genre', values: Defaults.colors10),
      modifiers: [StackModifier()],
    ),
  ],
  coord: PolarCoord(transposed: true, dimCount: 1, dimFill: 1.05),
  axes: [Defaults.circularAxis, Defaults.radialAxis],
);
