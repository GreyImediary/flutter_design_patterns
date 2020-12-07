import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';

class SingletonExampleCard extends StatelessWidget {
  final String text;


  SingletonExampleCard({@required this.text}): assert(text != null);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Container(
        height: 64,
        padding: EdgeInsets.all(paddingL),
        child: Center(
          child: Text(
            text,
            style: Theme.of(context).textTheme.bodyText1,
            textAlign: TextAlign.center,
          ),
        ),
      ),
    );
  }
}
