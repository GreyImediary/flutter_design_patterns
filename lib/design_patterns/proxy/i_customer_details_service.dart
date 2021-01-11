import 'package:flutter_design_patterns/design_patterns/proxy/customer_details.dart';

abstract class ICustomerDetailsService {
  Future<CustomerDetails> getCustomerDetails(String id);
}