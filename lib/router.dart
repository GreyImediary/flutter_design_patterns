import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/data/models/design_pattern.dart';
import 'package:flutter_design_patterns/data/models/design_pattern_category.dart';
import 'package:flutter_design_patterns/screens/category/category.dart';
import 'package:flutter_design_patterns/screens/design_pattern_details/design_pattern_details.dart';
import 'package:flutter_design_patterns/screens/main_menu/main_menu.dart';
import 'package:flutter_design_patterns/widgets/factory_method/factory_method.dart';
import 'package:flutter_design_patterns/widgets/singleton/singleton.dart';

class AppRouter {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case initialRoute:
        return MaterialPageRoute(
          builder: (_) => MainMenu(),
        );
      case categoryRoute:
        var category = settings.arguments as DesignPatternCategory;
        return MaterialPageRoute(
          builder: (_) => Category(
            category: category,
          ),
        );

      case _DesignPatternRoutes.singletonRoute:
        final pattern = settings.arguments as DesignPattern;
        return MaterialPageRoute(
            builder: (_) => DesignPatternDetails(
                  designPattern: pattern,
                  example: Singleton(),
                ));

      case _DesignPatternRoutes.factoryMethodRoute:
        final pattern = settings.arguments as DesignPattern;
        return MaterialPageRoute(
          builder: (_) => DesignPatternDetails(
            designPattern: pattern,
            example: FactoryMethod(),
          ),
        );

      default:
        return MaterialPageRoute(
          builder: (_) => MainMenu(),
        );
    }
  }
}

class _DesignPatternRoutes {
  static const String singletonRoute = '/singleton';
  static const String factoryMethodRoute = '/factory-method';
}
