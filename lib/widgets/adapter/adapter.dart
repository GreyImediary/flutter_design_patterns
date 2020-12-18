import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/design_patterns/adapter/adapters/json_adapter.dart';
import 'package:flutter_design_patterns/design_patterns/adapter/adapters/xml_adapter.dart';
import 'package:flutter_design_patterns/widgets/adapter/contacts_section.dart';

class Adapter extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScrollConfiguration(
      behavior: ScrollBehavior(),
      child: SingleChildScrollView(
        padding: EdgeInsets.symmetric(horizontal: paddingL),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ContactsSection(
              adapter: JsonContactsAdapter(),
              headerText: 'Contacts from JSON API',
            ),
            ContactsSection(
              adapter: XmlContactsAdapter(),
              headerText: 'Contacts form XML API',
            )
          ],
        ),
      ),
    );
  }
}
