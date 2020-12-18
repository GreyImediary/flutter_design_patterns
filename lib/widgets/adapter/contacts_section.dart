import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_design_patterns/constants.dart';
import 'package:flutter_design_patterns/design_patterns/adapter/contact.dart';
import 'package:flutter_design_patterns/design_patterns/adapter/icontacts_adapter.dart';
import 'package:flutter_design_patterns/widgets/adapter/contact_card.dart';

class ContactsSection extends StatefulWidget {
  final IContactsAdapter adapter;
  final String headerText;

  ContactsSection({@required this.adapter, @required this.headerText})
      : assert(adapter != null),
        assert(headerText != null);

  @override
  _ContactsSectionState createState() => _ContactsSectionState();
}

class _ContactsSectionState extends State<ContactsSection> {
  final List<Contact> contacts = [];

  void _getContacts() {
    setState(() {
      contacts.addAll(widget.adapter.getContacts());
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.headerText),
        const SizedBox(height: spaceM),
        Stack(
          children: [
            AnimatedOpacity(
              opacity: contacts.length > 0 ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: Column(
                children: [
                  for (var contact in contacts)
                    ContactCard(
                      contact: contact,
                    )
                ],
              ),
            ),
            AnimatedOpacity(
              opacity: contacts.length == 0 ? 1.0 : 0.0,
              duration: Duration(milliseconds: 500),
              child: MaterialButton(
                child: Text('Get contacts'),
                color: Colors.black87,
                textColor: Colors.white,
                onPressed: _getContacts,
              ),
            )
          ],
        )
      ],
    );
  }
}
