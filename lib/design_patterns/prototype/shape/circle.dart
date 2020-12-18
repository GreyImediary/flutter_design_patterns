import 'package:faker/faker.dart';

import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/prototype/shape.dart';

class Circle extends Shape {
  double radius;

  Circle(Color color, this.radius) : super(color);

  Circle.initial() : super(Colors.black87) {
    radius = 50.0;
  }

  Circle.clone(Circle source) : super.clone(source) {
    radius = source.radius;
  }

  @override
  Shape clone() {
    return Circle.clone(this);
  }

  @override
  void randomiseProperties() {
    color = Color.fromRGBO(
      random.integer(255),
      random.integer(255),
      random.integer(255),
      1,
    );

    radius = random.integer(70, min: 30).toDouble();
  }

  @override
  Widget render() {
    print(this.hashCode);
    return SizedBox(
      height: 120,
      child: Center(
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 500),
          height: 2 * radius,
          width: 2 * radius,
          decoration: BoxDecoration(color: color, shape: BoxShape.circle),
          child: Icon(
            Icons.star,
            color: Colors.white,
          ),
        ),
      ),
    );
  }
}
