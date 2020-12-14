import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/design_patterns/prototype/shape.dart';
import 'package:flutter_design_patterns/design_patterns/prototype/shape/circle.dart';
import 'package:flutter_design_patterns/design_patterns/prototype/shape/rectangle.dart';
import 'package:flutter_design_patterns/widgets/prototype/shape_column.dart';

class Prototype extends StatefulWidget {
  @override
  _PrototypeState createState() => _PrototypeState();
}

class _PrototypeState extends State<Prototype> {
  final Shape _circle = Circle.initial();
  final Shape _rectangle = Rectangle.initial();

  Shape _circleClone;
  Shape _rectangleClone;

  void _randomiseCircleProperties() {
    setState(() {
      _circle.randomiseProperties();
    });
  }

  void _cloneCircle() {
    setState(() {
      _circleClone = _circle.clone();
    });
  }

  void randomiseRectangleProperties() {
    setState(() {
      _rectangle.randomiseProperties();
    });
  }

  void _cloneRectangle() {
    setState(() {
      _rectangleClone = _rectangle.clone();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ShapeColumn(
              shape: _circle,
              shapeClone: _circleClone,
              onRandomisePropertiesPressed: _randomiseCircleProperties,
              onClonePressed: _cloneCircle,
            ),
            const  Divider(),
            ShapeColumn(
              shape: _rectangle,
              shapeClone: _rectangleClone,
              onRandomisePropertiesPressed: randomiseRectangleProperties,
              onClonePressed: _cloneRectangle,
            )
          ],
        ),
      ),
    );
  }
}
