import 'package:flutter_design_patterns/design_patterns/builder/burger_builder_base.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/bun/big_mac_bun.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/cheese.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/grill_seasoning.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/patty/beef_patty.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/sauce/big_mac_sauce.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/vegetable/onions.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/vegetable/pickle_slices.dart';
import 'package:flutter_design_patterns/design_patterns/builder/ingredient/vegetable/shredded_lettuce.dart';

class BigMacBuilder extends BurgerBuilderBase {
  BigMacBuilder() {
    price = 3.99;
  }

  @override
  void addBuns() {
    burger.addIngredient(BigMucBun());
  }

  @override
  void addVegetables() {
    burger
      ..addIngredient(Onions())
      ..addIngredient(PickleSlice())
      ..addIngredient(ShreddedLettuce());
  }

  @override
  void addSeasoning() {
    burger.addIngredient(GrillSeasoning());
  }

  @override
  void addSauces() {
    burger.addIngredient(BigMacSauce());
  }

  @override
  void addPatties() {
    burger.addIngredient(BeefPatty());
  }

  @override
  void addCheese() {
    burger.addIngredient(Cheese());
  }
}
