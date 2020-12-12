import 'package:flutter_design_patterns/design_patterns/builder/ingredient.dart';

class Cheese extends Ingredient {

  Cheese() {
    name = 'cheese';
    allergens = ['Milk', 'Soy'];
  }
}