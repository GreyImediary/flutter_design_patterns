import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/i_positioned_shape.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/shape/circle.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/shape/square.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/shape_type.dart';

class ShapeFactory {
  IPositionedShape createShape(ShapeType shapeType) {
    switch (shapeType) {
      case ShapeType.Circle:
        return Circle(
          color: Colors.red.withOpacity(0.2),
          diameter: 10.0,
        );
      case ShapeType.Square:
        return Square(
          color: Colors.blue.withOpacity(0.2),
          width: 10.0,
        );
      default:
        throw Exception('Shape type $shapeType is not supported');
    }
  }
}
