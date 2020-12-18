import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/entity/customer.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/entity/order.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/irepository.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/istorage.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/repository/customers_repository.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/repository/orders_repository.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/storage/file_storage.dart';
import 'package:flutter_design_patterns/design_patterns/bridge/storage/sql_storage.dart';
import 'package:flutter_design_patterns/widgets/bridge/data_table/customer_data_table.dart';
import 'package:flutter_design_patterns/widgets/bridge/data_table/order_data_table.dart';
import 'package:flutter_design_patterns/widgets/bridge/storage_selection.dart';

class Bridge extends StatefulWidget {
  @override
  _BridgeState createState() => _BridgeState();
}

class _BridgeState extends State<Bridge> {
  final List<IStorage> _storages = [SqlStorage(), FileStorage()];

  IRepository _customersRepository;
  IRepository _ordersRepository;

  List<Customer> _customers;
  List<Order> _orders;

  int _selectedCustomerStorageIndex = 0;
  int _selectedOrderStorageIndex = 0;

  void _onSelectedCustomerStorageIndexChanged(int index) {
    setState(() {
      _selectedCustomerStorageIndex = index;
      _customersRepository = CustomersRepository(_storages[index]);
      _customers = _customersRepository.getAll();
    });
  }

  void _onSelectedOrderStorageIndexChanged(int index) {
    setState(() {
      _selectedOrderStorageIndex = index;
      _ordersRepository = OrdersRepository(_storages[index]);
      _orders = _ordersRepository.getAll();
    });
  }

  void _addCustomer() {
    _customersRepository.save(Customer());

    setState(() {
      _customers = _customersRepository.getAll();
    });
  }

  void _addOrder() {
    _ordersRepository.save(Order());

    setState(() {
      _orders = _ordersRepository.getAll();
    });
  }

  @override
  void initState() {
    super.initState();

    _customersRepository =
        CustomersRepository(_storages[_selectedCustomerStorageIndex]);
    _customers = _customersRepository.getAll();

    _ordersRepository = OrdersRepository(_storages[_selectedOrderStorageIndex]);
    _orders = _ordersRepository.getAll();
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: const EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Text(
                  'Select customers storage:',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
            StorageSelection(
              storages: _storages,
              selectedIndex: _selectedCustomerStorageIndex,
              onChanged: _onSelectedCustomerStorageIndexChanged,
            ),
            MaterialButton(
              child: Text('Add'),
              color: Colors.black87,
              textColor: Colors.white,
              onPressed: _addCustomer,
            ),
            _customers.isNotEmpty
                ? CustomerDataTable(customers: _customers)
                : Text(
                    '0 customers found',
                    style: Theme.of(context).textTheme.subtitle2,
                  ),

            Divider(),

            Row(
              children: [
                Text(
                  'Select orders storage:',
                  style: Theme.of(context).textTheme.headline6,
                )
              ],
            ),
            StorageSelection(
              storages: _storages,
              selectedIndex: _selectedOrderStorageIndex,
              onChanged: _onSelectedOrderStorageIndexChanged,
            ),
            MaterialButton(
              child: Text('Add'),
              color: Colors.black87,
              textColor: Colors.white,
              onPressed: _addOrder,
            ),
            _orders.isNotEmpty
                ? OrderDataTable(orders: _orders)
                : Text(
              '0 orders found',
              style: Theme.of(context).textTheme.subtitle2,
            ),
          ],
        ),
      ),
    );
  }
}
