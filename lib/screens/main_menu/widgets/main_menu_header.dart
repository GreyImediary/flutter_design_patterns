import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/widgets/heartbeat_animation.dart';

class MainMenuHeader extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: paddingL),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            'Flutter\nDesign Patterns',
            style: Theme.of(context).textTheme.display1,
          ),
        ],
      ),
    );
  }
}
