# Atlas de gráficas · community_charts_flutter

Aplicación Flutter de evidencias para la librería [`community_charts_flutter`](https://pub.dev/packages/community_charts_flutter). La colección contiene exactamente **40 gráficas básicas** y **25 gráficas avanzadas**: 65 ejemplos en total.

## Ejecutar

```powershell
flutter pub get
flutter run -d chrome
```

También se puede abrir en Windows con `flutter run -d windows`.

## Colección

Los ejemplos cubren barras verticales y horizontales, series de líneas, gráficos de torta y dispersión. Las avanzadas añaden comparaciones de varias series, barras agrupadas/apiladas, áreas, gráficos de anillo y burbujas. Usa la navegación para cambiar entre colecciones y el buscador para filtrar por nombre, tema o tipo.

La aplicación utiliza datos didácticos deterministas generados localmente. Así, cada gráfico se puede revisar sin depender de una API ni de conexión de red.

## Verificación

```powershell
flutter analyze
flutter test
```