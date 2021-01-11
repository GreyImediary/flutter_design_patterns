import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/design_patterns/proxy/customer.dart';
import 'package:flutter_design_patterns/design_patterns/proxy/i_customer_details_service.dart';
import 'package:flutter_design_patterns/widgets/proxy/customer_details_column.dart';

class CustomerDetailsDialog extends StatefulWidget {
  final Customer customer;
  final ICustomerDetailsService service;

  CustomerDetailsDialog({
    @required this.customer,
    @required this.service,
  })  : assert(customer != null),
        assert(service != null);

  @override
  _CustomerDetailsDialogState createState() => _CustomerDetailsDialogState();
}

class _CustomerDetailsDialogState extends State<CustomerDetailsDialog> {
  @override
  void initState() {
    super.initState();

    widget.service
        .getCustomerDetails(widget.customer.id)
        .then((customerDetail) => setState(
              () {
                widget.customer.details = customerDetail;
              },
            ));
  }

  void _closeDialog() {
    Navigator.of(context).pop();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: Text(widget.customer.name),
      content: Container(
        height: 200,
        child: widget.customer.details == null
            ? Center(
                child: CircularProgressIndicator(
                  backgroundColor: lightBackgroundColor,
                  valueColor: AlwaysStoppedAnimation<Color>(
                    Colors.black.withOpacity(0.65),
                  ),
                ),
              )
            : CustomerDetailsColumn(customerDetails: widget.customer.details),
      ),
      actions: [
        MaterialButton(
          onPressed: _closeDialog,
          color: Colors.black87,
          textColor: Colors.white,
          child: Text('Close'),
        )
      ],
    );
  }
}
