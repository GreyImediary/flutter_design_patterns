import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/i_positioned_shape.dart';

class Circle implements IPositionedShape {
  final Color color;
  final double diameter;

  Circle({@required this.color, @required this.diameter})
      : assert(color != null),
        assert(diameter != null);

  @override
  Widget render(double x, double y) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        height: diameter,
        width: diameter,
        decoration: BoxDecoration(
          color: color,
          shape: BoxShape.circle
        ),
      ),
    );
  }
}
