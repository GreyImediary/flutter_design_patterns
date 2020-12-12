import 'package:flutter_design_patterns/design_patterns/builder/burger_builder_base.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/bun/regular_bun.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/patty/mc_chicken_patty.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/sauce/mayonnaise.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/vegetable/shredded_lettuce.dart';

class McChickenBuilder extends BurgerBuilderBase {

  McChickenBuilder() {
    price = 1.29;
  }

  @override
  void addVegetables() {
    burger.addIngredient(ShreddedLettuce());
  }

  @override
  void addSeasoning() {
    // Not needed
  }

  @override
  void addSauces() {
    burger.addIngredient(Mayonnaise());
  }

  @override
  void addPatties() {
    burger.addIngredient(McChickenPatty());
  }

  @override
  void addCheese() {
    // Not needed
  }

  @override
  void addBuns() {
    burger.addIngredient(RegularBun());
  }
}