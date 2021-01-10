import 'package:flutter/cupertino.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/i_positioned_shape.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/shape_factory.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/shape_type.dart';

class ShapeFlyweightFactory {
  final ShapeFactory shapeFactory;
  final Map<ShapeType, IPositionedShape> shapesMap =
      Map<ShapeType, IPositionedShape>();

  ShapeFlyweightFactory({
    @required this.shapeFactory,
  }) : assert(shapeFactory != null);

  IPositionedShape getShape(ShapeType shapeType) {
    if (!shapesMap.containsKey(shapeType)) {
      shapesMap[shapeType] = shapeFactory.createShape(shapeType);
    }

    return shapesMap[shapeType];
  }

  int getInstanceCount() => shapesMap.length;
}
