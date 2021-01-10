import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/i_positioned_shape.dart';

class Square implements IPositionedShape {
  final Color color;
  final double width;

  Square({@required this.color, @required this.width})
      : assert(color != null),
        assert(width != null);

  @override
  Widget render(double x, double y) {
    return Positioned(
      left: x,
      bottom: y,
      child: Container(
        width: width,
        height: width,
        color: color,
      ),
    );
  }
}
