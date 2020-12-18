import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/entity/order.dart';

class OrderDataTable extends StatelessWidget {
  final List<Order> orders;

  OrderDataTable({@required this.orders}) : assert(orders != null);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: DataTable(
        columnSpacing: spaceM,
        horizontalMargin: marginM,
        headingRowHeight: spaceXL,
        dataRowHeight: spaceXL,
        columns: <DataColumn>[
          DataColumn(
            label: Text(
              'Dishes',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          DataColumn(
            label: Text(
              'Total',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
        rows: <DataRow>[
          for (var order in orders)
            DataRow(
              cells: [
                DataCell(Text(order.dishes.join(', '))),
                DataCell(Text(order.total.toStringAsFixed(2)))
              ],
            ),
        ],
      ),
    );
  }
}
