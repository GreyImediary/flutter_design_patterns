import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/factory/android_widget_factory.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/factory/ios_widget_factory.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/iwidget_factory.dart';

import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/iactivity_indicator.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/islider.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/iswitch.dart';

import 'factory_selection.dart';

class AbstractFactory extends StatefulWidget {
  @override
  _AbstractFactoryState createState() => _AbstractFactoryState();
}

class _AbstractFactoryState extends State<AbstractFactory> {
  final widgetFactories = <IWidgetFactory>[
    AndroidWidgetFactory(),
    IosWidgetFactory()
  ];

  int _selectedFactoryIndex = 0;

  IActivityIndicator _activityIndicator;

  ISlider _slider;
  double _sliderValue = 50.0;
  String get _sliderValueString => _sliderValue.toStringAsFixed(0);

  ISwitch _switch;
  bool _switchValue = false;
  String get _switchValueString => _switchValue ? 'ON' : 'OFF';

  @override
  void initState() {
    super.initState();
    _createWidgets();
  }

  void _createWidgets() {
    _activityIndicator =
        widgetFactories[_selectedFactoryIndex].createActivityIndicator();
    _slider = widgetFactories[_selectedFactoryIndex].createSlider();
    _switch = widgetFactories[_selectedFactoryIndex].createSwitch();
  }

  void _setSelectedFactoryIndex(int index) {
    setState(() {
      _selectedFactoryIndex = index;
      _createWidgets();
    });
  }

  void _setSliderValue(double value) {
    setState(() {
      _sliderValue = value;
    });
  }

  void _setSwitchValue(bool value) {
    setState(() {
      _switchValue = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          children: <Widget>[
            FactorySelection(
              widgetsFactoryList: widgetFactories,
              selectedIndex: _selectedFactoryIndex,
              onChanged: _setSelectedFactoryIndex,
            ),
            const SizedBox(height: spaceL),
            Text(
              'Widgets showcase',
              style: Theme.of(context).textTheme.headline6,
            ),
            const SizedBox(height: spaceXL),
            Text(
              'Process indicator',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: spaceL),
            _activityIndicator.render(),
            const SizedBox(height: spaceXL),
            Text(
              'Slider ($_sliderValueString%)',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: spaceL),
            _slider.render(_sliderValue, _setSliderValue),
            const SizedBox(height: spaceXL),
            Text(
              'Switch ($_switchValueString)',
              style: Theme.of(context).textTheme.subtitle1,
            ),
            const SizedBox(height: spaceL),
            _switch.render(_switchValue, _setSwitchValue),
          ],
        ),
      ),
    );
  }
}