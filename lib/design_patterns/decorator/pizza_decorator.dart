import 'package:flutter_design_patterns/design_patterns/decorator/pizza.dart';

abstract class PizzaDecorator extends Pizza {
  final Pizza pizza;

  PizzaDecorator(this.pizza);

  @override
  double getPrice() {
    return pizza.getPrice();
  }

  @override
  String getDescription() {
    return pizza.getDescription();
  }
}