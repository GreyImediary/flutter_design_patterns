import 'package:flutter/material.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/islider.dart';

class AndroidSlider implements ISlider {
  @override
  Widget render(double value, ValueSetter<double> onChanged) {
    return Slider(
      value: value,
      onChanged: onChanged,
      activeColor: Colors.black,
      inactiveColor: Colors.grey,
      min: 0.0,
      max: 100.0,
    );
  }
}
