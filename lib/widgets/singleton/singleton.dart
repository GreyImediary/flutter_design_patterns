import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/design_patterns/singleton/example_state.dart';
import 'package:flutter_design_patterns/design_patterns/singleton/example_state_without_singleton.dart';
import 'package:flutter_design_patterns/widgets/singleton/singleton_example_card.dart';

class Singleton extends StatefulWidget {
  @override
  _SingletonState createState() => _SingletonState();
}

class _SingletonState extends State<Singleton> {
  final examplesList = [ExampleState(), ExampleStateWithoutSingleton()];

  void _setTextValues([String text = 'Singleton']) {
    for (var example in examplesList) {
      example.setStateText(text);
    }

    setState(() {});
  }

  void _resetText() {
    for (var example in examplesList) {
      example.reset();
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          children: [
            for (var example in examplesList)
              Padding(
                padding: EdgeInsets.only(bottom: paddingL),
                child: SingletonExampleCard(
                  text: example.currentText,
                ),
              ),
            const SizedBox(
              height: paddingL,
            ),
            MaterialButton(
              onPressed: _setTextValues,
              child: Text("Change texts to 'Singleton'"),
              color: Colors.black87,
              textColor: Colors.white,
            ),
            MaterialButton(
              onPressed: _resetText,
              child: Text('Reset texts'),
              color: Colors.black87,
              textColor: Colors.white,
            ),
            const SizedBox(height: spaceXL,),
            Text(
              'Note: change states\' text and navigate the application '
                '(e.g. go to the tab "description" or main menu, then go back to this example) '
                'to see how the Singleton state behaves!',
              textAlign: TextAlign.justify,
            )
          ],
        ),
      ),
    );
  }
}
