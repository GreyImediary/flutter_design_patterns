import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/i_positioned_shape.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/shape_factory.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/shape_flyweight_factory.dart';
import 'package:flutter_design_patterns/design_patterns/flyweight/shape_type.dart';
import 'package:flutter_design_patterns/widgets/flyweight/positioned_shape_wrapper.dart';

class Flyweight extends StatefulWidget {
  @override
  _FlyweightState createState() => _FlyweightState();
}

class _FlyweightState extends State<Flyweight> {
  static const int SHAPE_COUNT = 1000;

  final ShapeFactory shapeFactory = ShapeFactory();

  ShapeFlyweightFactory _shapeFlyweightFactory;
  List<IPositionedShape> _shapeList;

  int _shapeInstanceCount = 0;
  bool _useFlyweightFactory = false;

  @override
  void initState() {
    _shapeFlyweightFactory = ShapeFlyweightFactory(shapeFactory: shapeFactory);
    _buildShapeList();

    super.initState();
  }

  void _buildShapeList() {
    var shapeInstanceCount = 0;
    _shapeList = List<IPositionedShape>();

    for (var i = 0; i < SHAPE_COUNT; i++) {
      var shapeType = _getRandomShapeType();
      var shape = _useFlyweightFactory
          ? _shapeFlyweightFactory.getShape(shapeType)
          : shapeFactory.createShape(shapeType);

      shapeInstanceCount++;
      _shapeList.add(shape);
    }

    setState(() {
      _shapeInstanceCount = _useFlyweightFactory
          ? _shapeFlyweightFactory.getInstanceCount()
          : shapeInstanceCount;
    });
  }

  ShapeType _getRandomShapeType() {
    var values = ShapeType.values;

    return values[Random().nextInt(values.length)];
  }

  void _toggleFlyweightFactory(bool value) {
    setState(() {
      _useFlyweightFactory = value;
    });

    _buildShapeList();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        for (var shape in _shapeList) PositionedShapeWrapper(shape: shape),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SwitchListTile.adaptive(
              title: Text(
                'Use flyweight factory',
                style: TextStyle(fontWeight: FontWeight.bold),
              ),
              activeColor: Colors.black,
              value: _useFlyweightFactory,
              onChanged: _toggleFlyweightFactory,
            )
          ],
        ),
        Center(
          child: Text(
            'Shape instances count: $_shapeInstanceCount',
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
        )
      ],
    );
  }
}
