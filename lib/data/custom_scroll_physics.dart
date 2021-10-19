// ignore_for_file: annotate_overrides, overridden_fields, unused_import

import 'package:flutter/material.dart';

import 'dart:async';
import 'dart:math' as math;

class CustomSimulation extends Simulation {
  final double initPosition;
  double currentPosition = 0.0;
  double velocity;
  BuildContext context;

  CustomSimulation({required this.initPosition, required this.velocity, required this.context});

  @override
  double x(double time) {
    var max;
    return max;
  }

  @override
  double dx(double time) {
    return velocity;
  }

  @override
  bool isDone(double time) {
    return false;
  }
}

class NotesCustomScrollPhysics extends ScrollPhysics {
  BuildContext context;

  NotesCustomScrollPhysics({required this.context});

  @override
  ScrollPhysics applyTo(ScrollPhysics? ancestor) {
    return NotesCustomScrollPhysics(context: context);
  }

  @override
  Simulation createBallisticSimulation(
    ScrollMetrics position,
    double velocity,
  ) {
    return CustomSimulation(
      initPosition: position.pixels,
      velocity: velocity,
      context: context,
    );
  }
}
