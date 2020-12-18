import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/istorage.dart';

class StorageSelection extends StatelessWidget {
  final List<IStorage> storages;
  final int selectedIndex;
  final ValueSetter<int> onChanged;

  StorageSelection(
      {@required this.storages,
      @required this.selectedIndex,
      @required this.onChanged})
      : assert(storages != null),
        assert(selectedIndex != null),
        assert(onChanged != null);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        for (var i = 0; i < storages.length; i++)
          RadioListTile(
            activeColor: Colors.black87,
            controlAffinity: ListTileControlAffinity.platform,
            value: i,
            title: Text(storages[i].getTitle()),
            groupValue: selectedIndex,
            onChanged: onChanged,
          )
      ],
    );
  }
}
