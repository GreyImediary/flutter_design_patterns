import 'package:flutter/material.dart';

import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/data/models/design_pattern.dart';
import 'package:flutter_design_patterns/data/models/design_pattern_category.dart';
import 'package:flutter_design_patterns/screens/category/category.dart';
import 'package:flutter_design_patterns/screens/design_pattern_details/design_pattern_details.dart';
import 'package:flutter_design_patterns/screens/main_menu/main_menu.dart';
import 'package:flutter_design_patterns/widgets/abstract_factory/abstract_factory.dart';
import 'package:flutter_design_patterns/widgets/adapter/adapter.dart';
import 'package:flutter_design_patterns/widgets/bridge/bridge.dart';
import 'package:flutter_design_patterns/widgets/builder/builder.dart';
import 'package:flutter_design_patterns/widgets/composite/composite.dart';
import 'package:flutter_design_patterns/widgets/decorator/decorator_example.dart';
import 'package:flutter_design_patterns/widgets/facade/facade.dart';
import 'package:flutter_design_patterns/widgets/factory_method/factory_method.dart';
import 'package:flutter_design_patterns/widgets/flyweight/flyweight.dart';
import 'package:flutter_design_patterns/widgets/prototype/prototype.dart';
import 'package:flutter_design_patterns/widgets/proxy/proxy.dart';
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

      case _DesignPatternRoutes.abstractFactoryRoute:
        final pattern = settings.arguments as DesignPattern;
        return MaterialPageRoute(
          builder: (_) => DesignPatternDetails(
            designPattern: pattern,
            example: AbstractFactory(),
          ),
        );

      case _DesignPatternRoutes.builderRoute:
        final pattern = settings.arguments as DesignPattern;
        return MaterialPageRoute(
          builder: (_) => DesignPatternDetails(
            designPattern: pattern,
            example: BuilderExample(),
          ),
        );

      case _DesignPatternRoutes.prototypeRoute:
        final pattern = settings.arguments as DesignPattern;
        return MaterialPageRoute(
          builder: (_) => DesignPatternDetails(
            designPattern: pattern,
            example: Prototype(),
          ),
        );

      case _DesignPatternRoutes.adapterRoute:
        final pattern = settings.arguments as DesignPattern;
        return MaterialPageRoute(
          builder: (_) => DesignPatternDetails(
            designPattern: pattern,
            example: Adapter(),
          ),
        );

      case _DesignPatternRoutes.bridgeRoute:
        final pattern = settings.arguments as DesignPattern;
        return MaterialPageRoute(
          builder: (_) => DesignPatternDetails(
            designPattern: pattern,
            example: Bridge(),
          ),
        );

      case _DesignPatternRoutes.compositeRoute:
        final pattern = settings.arguments as DesignPattern;
        return MaterialPageRoute(
          builder: (_) => DesignPatternDetails(
            designPattern: pattern,
            example: Composite(),
          ),
        );

      case _DesignPatternRoutes.facadeRoute:
        final pattern = settings.arguments as DesignPattern;
        return MaterialPageRoute(
          builder: (_) => DesignPatternDetails(
            designPattern: pattern,
            example: Facade(),
          ),
        );

      case _DesignPatternRoutes.decoratorRoute:
        final pattern = settings.arguments as DesignPattern;
        return MaterialPageRoute(
          builder: (_) => DesignPatternDetails(
            designPattern: pattern,
            example: Decorator(),
          ),
        );

      case _DesignPatternRoutes.flyweightRoute:
        final pattern = settings.arguments as DesignPattern;
        return MaterialPageRoute(
          builder: (_) => DesignPatternDetails(
            designPattern: pattern,
            example: Flyweight(),
          ),
        );


      case _DesignPatternRoutes.proxyRoute:
        final pattern = settings.arguments as DesignPattern;
        return MaterialPageRoute(
          builder: (_) => DesignPatternDetails(
            designPattern: pattern,
            example: Proxy(),
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
  static const String abstractFactoryRoute = '/abstract-factory';
  static const String builderRoute = '/builder';
  static const String prototypeRoute = '/prototype';

  static const String adapterRoute = '/adapter';
  static const String bridgeRoute = '/bridge';
  static const String compositeRoute = '/composite';
  static const String facadeRoute = '/facade';
  static const String decoratorRoute = '/decorator';
  static const String flyweightRoute = '/flyweight';
  static const String proxyRoute = '/proxy';
}
