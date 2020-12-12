
import 'package:flutter/foundation.dart';

abstract class Ingredient {
  @protected
  List<String> allergens;
  @protected
  String name;

  List<String> getAllergens() {
    return allergens;
  }

  String getName() {
    return name;
  }
}