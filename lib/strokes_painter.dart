import 'package:flutter/material.dart';
import 'package:built_collection/built_collection.dart';
import './stroke_painter.dart';
import 'models/stroke.dart';

class StrokesPainter extends CustomPainter {
  final BuiltList<Stroke>? strokes;
  final StrokeCap strokeCap;

  StrokesPainter({
    this.strokes,
    required this.strokeCap,
  });

  @override
  void paint(Canvas canvas, Size size) {
    if (strokes != null) {
      for (final stroke in strokes!) {
        StrokePainter(stroke: stroke, strokeCap: strokeCap).paint(canvas, size);
      }
    }
  }

  @override
  bool shouldRepaint(StrokesPainter oldDelegate) =>
      strokes != oldDelegate.strokes;
}