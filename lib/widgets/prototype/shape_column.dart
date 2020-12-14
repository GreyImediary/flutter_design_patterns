import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/design_patterns/prototype/shape.dart';
import 'package:flutter_design_patterns/widgets/prototype/sized_shape_column.dart';

class ShapeColumn extends StatelessWidget {
  final Shape shape;
  final Shape shapeClone;
  final VoidCallback onRandomisePropertiesPressed;
  final VoidCallback onClonePressed;

  ShapeColumn(
      {this.shape,
      this.shapeClone,
      this.onRandomisePropertiesPressed,
      this.onClonePressed})
      : assert(shape != null),
        assert(onRandomisePropertiesPressed != null),
        assert(onClonePressed != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedShapeColumn(
              label: 'Original shape',
              child: shape.render(),
            ),
            const SizedBox(width: spaceM),
            SizedShapeColumn(
              label: 'Cloned shape',
              child: shapeClone == null
                  ? SizedBox(
                      height: 200,
                      width: 200,
                      child: Placeholder(),
                    )
                  : shapeClone.render(),
            ),
          ],
        ),
        MaterialButton(
          onPressed: onRandomisePropertiesPressed,
          child: Text('Randomise properties'),
          color: Colors.black87,
          textColor: Colors.white,
        ),
        MaterialButton(
          onPressed: onClonePressed,
          child: Text('Clone shape'),
          color: Colors.black87,
          textColor: Colors.white,
        ),
      ],
    );
  }
}
