import 'package:flutter_design_patterns/design_patterns/builder/burger.dart';
import 'package:flutter_design_patterns/design_patterns/builder/burger_builder_base.dart';

class BurgerMaker {
  BurgerBuilderBase burgerBuilder;

  BurgerMaker(this.burgerBuilder);

  void changeBurgerBuilder(BurgerBuilderBase builder) {
    burgerBuilder = builder;
  }

  Burger getBurger() {
    return burgerBuilder.getBurger();
  }

  void prepareBurger() {
    burgerBuilder.createBurger();
    burgerBuilder.setBurgerPrice();

    burgerBuilder
      ..addBuns()
      ..addCheese()
      ..addPatties()
      ..addSauces()
      ..addSeasoning()
      ..addVegetables();
  }
}
