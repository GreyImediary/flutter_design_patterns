import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/design_patterns/proxy/customer.dart';
import 'package:flutter_design_patterns/design_patterns/proxy/customer_details_service.dart';
import 'package:flutter_design_patterns/design_patterns/proxy/customer_details_service_proxy.dart';
import 'package:flutter_design_patterns/design_patterns/proxy/i_customer_details_service.dart';
import 'package:flutter_design_patterns/widgets/proxy/customer_details_dialog.dart';

class Proxy extends StatefulWidget {
  @override
  _ProxyState createState() => _ProxyState();
}

class _ProxyState extends State<Proxy> {
  final ICustomerDetailsService _customerDetailsServiceProxy =
      CustomerDetailsServiceProxy(CustomerDetailsService());

  final List<Customer> customers = List.generate(10, (_) => Customer());

  void _showCustomerDetails(Customer customer) {
    showDialog<void>(
        context: context,
        barrierDismissible: false,
        builder: (BuildContext _) {
          return CustomerDetailsDialog(
            customer: customer,
            service: _customerDetailsServiceProxy,
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          children: [
            Text(
              'Press on list tile to see more information about the customer',
              style: Theme.of(context).textTheme.subtitle1,
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: spaceL),
            for (var customer in customers)
              Card(
                child: ListTile(
                  leading: CircleAvatar(
                    backgroundColor: Colors.grey,
                    child: Text(
                      customer.name[0],
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  trailing: Icon(Icons.info_outline),
                  title: Text(customer.name),
                  onTap: () => _showCustomerDetails(customer),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
