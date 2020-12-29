import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

class ModeSwitcher extends StatelessWidget {
  final String title;
  final bool activated;
  final ValueSetter<bool> onChanged;

  ModeSwitcher(
      {@required this.title,
      @required this.activated,
      @required this.onChanged})
      : assert(title != null),
        assert(activated != null);

  @override
  Widget build(BuildContext context) {
    return SwitchListTile.adaptive(
      value: activated,
      activeColor: Colors.black87,
      onChanged: onChanged,
      title: Text(title),
    );
  }
}
