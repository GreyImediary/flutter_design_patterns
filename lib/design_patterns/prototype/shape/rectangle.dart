import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/prototype/shape.dart';

class Rectangle extends Shape {
  double width;
  double height;

  Rectangle(Color color, this.width, this.height) : super(color);

  Rectangle.clone(Rectangle source) : super.clone(source) {
    height = source.height;
    width = source.width;
  }

  Rectangle.initial() : super(Colors.black) {
    height = 100.0;
    width = 100.0;
  }

  @override
  Shape clone() {
    return Rectangle.clone(this);
  }

  @override
  void randomiseProperties() {
    color = Color.fromRGBO(
        Random().nextInt(255), Random().nextInt(255), Random().nextInt(255), 1);

    height =  50 + Random().nextInt(100 - 50).toDouble();
    width = 50 + Random().nextInt(100 - 50).toDouble();
  }

  @override
  Widget render() {
    return SizedBox(
      height: 120.0,
      child: Center(
        child: AnimatedContainer(
          duration: Duration(milliseconds: 500),
          height: height,
          width: width,
          decoration: BoxDecoration(
            color: color,
            shape: BoxShape.rectangle
          ),
          child: Icon(
            Icons.star,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
