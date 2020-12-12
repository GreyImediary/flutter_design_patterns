import 'package:flutter_design_patterns/design_patterns/builder/ingredient.dart';

class Burger {
  final List<Ingredient> _ingredients = [];
  double _price;

  void addIngredient(Ingredient ingredient) {
    _ingredients.add(ingredient);
  }

  String getFormattedIngredients() {
    return _ingredients.map((ingredient) => ingredient.getName()).join(', ');
  }

  String getFormattedAllergens() {
    final Set<String> allergens = {};

    _ingredients.forEach((ingredient) =>
        allergens.addAll(ingredient.getAllergens())
    );

    return allergens.join(', ');
  }

  String getFormattedPrice() {
    return '\$${_price.toStringAsFixed(2)}';
  }

  void setPrice(double price) {
    _price = price;
  }
}