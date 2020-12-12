import 'package:flutter_design_patterns/design_patterns/builder/burger_builder_base.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/bun/regular_bun.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/grill_seasoning.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/patty/beef_patty.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/sauce/ketchup.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/sauce/mustard.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/vegetable/onions.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/vegetable/pickle_slices.dart';

class HamburgerBuilder extends BurgerBuilderBase {

  HamburgerBuilder() {
    price = 1.0;
  }

  @override
  void addVegetables() {
    burger
      ..addIngredient(Onions())
      ..addIngredient(PickleSlice());
  }

  @override
  void addSeasoning() {
    burger.addIngredient(GrillSeasoning());
  }

  @override
  void addSauces() {
    burger
      ..addIngredient(Ketchup())
      ..addIngredient(Mustard());
  }

  @override
  void addPatties() {
    burger.addIngredient(BeefPatty());
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