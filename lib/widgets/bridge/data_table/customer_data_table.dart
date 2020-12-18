import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/entity/customer.dart';

class CustomerDataTable extends StatelessWidget {
  final List<Customer> customers;

  CustomerDataTable({@required this.customers}) : assert(customers != null);

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
              'Name',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
          DataColumn(
            label: Text(
              'E-mail',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
            ),
          ),
        ],
        rows: <DataRow>[
          for (var customer in customers)
            DataRow(
              cells: [
                DataCell(Text(customer.name)),
                DataCell(Text(customer.email))
              ],
            ),
        ],
      ),
    );
  }
}
