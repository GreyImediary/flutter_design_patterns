import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/design_patterns/decorator/pizza.dart';
import 'package:flutter_design_patterns/design_patterns/decorator/pizza_menu.dart';
import 'package:flutter_design_patterns/design_patterns/decorator/pizza_toppings/pizza_topping_data.dart';
import 'package:flutter_design_patterns/widgets/decorator/custom_pizza_selection.dart';
import 'package:flutter_design_patterns/widgets/decorator/pizza_information.dart';
import 'package:flutter_design_patterns/widgets/decorator/pizza_selection.dart';

class Decorator extends StatefulWidget {
  @override
  _DecoratorState createState() => _DecoratorState();
}

class _DecoratorState extends State<Decorator> {
  final PizzaMenu pizzaMenu = PizzaMenu();

  Map<int, PizzaToppingData> _pizzaToppingsDataMap;
  Pizza _pizza;
  int _selectedIndex = 0;

  @override
  void initState() {
    _pizzaToppingsDataMap = pizzaMenu.getPizzaToppingsDataMap();
    _pizza = pizzaMenu.getPizza(0, _pizzaToppingsDataMap);
    super.initState();
  }

  void _onSelectedIndexChanged(int index) {
    _setSelectedIndex(index);
    _setSelectedPizza(index);
  }

  void _setSelectedIndex(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  void _setSelectedPizza(int index) {
    setState(() {
      _pizza = pizzaMenu.getPizza(index, _pizzaToppingsDataMap);
    });
  }

  void _onCustomPizzaChipSelected(int index, bool selected) {
    _setChipSelected(index, selected);
    _setSelectedPizza(index);
  }

  void _setChipSelected(int index, bool selected) {
    setState(() {
      _pizzaToppingsDataMap[index].setSelected(selected);
    });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          children: [
            Row(
              children: [
                Text(
                  'Select your pizza',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
            PizzaSelection(
              selectedIndex: _selectedIndex,
              onChanged: _onSelectedIndexChanged,
            ),
            AnimatedContainer(
              height: _selectedIndex == 2 ? 100.0 : 0.0,
              duration: const Duration(milliseconds: 500),
              child: CustomPizzaSelection(
                pizzaToppingsDataMap: _pizzaToppingsDataMap,
                onSelected: _onCustomPizzaChipSelected,
              ),
            ),
            PizzaInformation(pizza: _pizza)
          ],
        ),
      ),
    );
  }
}
