import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class PizzaSelection extends StatelessWidget {
  final List<String> labels = ['Pizza Margherita', 'Pizza Pepperoni', 'Custom'];
  final int selectedIndex;
  final ValueSetter<int> onChanged;

  PizzaSelection({@required this.selectedIndex,@required this.onChanged})
      : assert(selectedIndex != null),
        assert(onChanged != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < labels.length; i++)
          RadioListTile(
            value: i,
            groupValue: selectedIndex,
            onChanged: onChanged,
            selected: i == selectedIndex,
            controlAffinity: ListTileControlAffinity.platform,
            title: Text(labels[i]),
          )
      ],
    );
  }
}
