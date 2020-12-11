import 'package:flutter_design_patterns/design_patterns/abstract_factory/iwidget_factory.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/activity_indicator/android_activity_indicator.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/iactivity_indicator.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/islider.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/iswitch.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/slider/android_slider.dart';
import 'package:flutter_design_patterns/design_patterns/abstract_factory/widgets/switch/android_switch.dart';

class AndroidWidgetFactory implements IWidgetFactory {

  @override
  String getTitle() {
    return 'Android widgets';
  }

  @override
  ISwitch createSwitch() {
    return AndroidSwitch();
  }

  @override
  ISlider createSlider() {
    return AndroidSlider();
  }

  @override
  IActivityIndicator createActivityIndicator() {
   return AndroidActivityIndicator();
  }
}