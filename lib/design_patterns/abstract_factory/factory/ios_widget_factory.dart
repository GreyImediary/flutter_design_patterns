import 'package:flutter_design_patterns/design_patterns/abstract_factory/iwidget_factory.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/activity_indicator/ios_activity_indicator.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/iactivity_indicator.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/islider.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/iswitch.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/slider/ios_slider.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/switch/ios_switch.dart';

class IosWidgetFactory implements IWidgetFactory {

  @override
  String getTitle() {
    return 'Ios widgets';
  }

  @override
  ISwitch createSwitch() {
    return IosSwitch();
  }

  @override
  ISlider createSlider() {
    return IosSlider();
  }

  @override
  IActivityIndicator createActivityIndicator() {
    return IosActivityIndicator();
  }
}